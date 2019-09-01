module App
  # FrontsController
  class FrontController < AppController
    layout 'layouts/templates/application'
    before_action :message

    def send_message
    end
    
    def new_message
      @message = KepplerContactUs::Message.new(
        message_params
      )
      if verify_recaptcha(model: @message) && @message.save
        UserMailer.send_new_message(@message).deliver_now
        UserMailer.send_new_message_admin(@message).deliver_now
        flash[:notice] = 'Mensaje enviado'
        flash[:name] = params[:message][:name]

        redirect_to root_path
      else
        redirect_to root_path
        flash[:notice] = 'Mensaje no enviado'
      end

    end

    def index
      @banners = KepplerBanners::Banner.all
      @services = KepplerServices::Service.all
      @testimonies = KepplerTestimonials::Testimony.all
    end

    def about
      @testimonies = KepplerTestimonials::Testimony.all
    end

    def services
      @services = KepplerServices::Service.find(params[:id])
    end

    def testimonials
      @testimonies = KepplerTestimonials::Testimony.find(params[:id])
    end

    private
    def message
      @message = KepplerContactUs::Message.new
    end

    def message_params
      params.require(:message).permit(
        :name,
        :from_email,
        # { to_emails: [] },
        :to_emails,
        :subject,
        :content,
        :read,
        :position,
        :deleted_at
      )
    end

  end
end
