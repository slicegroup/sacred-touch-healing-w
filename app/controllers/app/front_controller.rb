module App
  # FrontsController
  class FrontController < AppController
    layout 'layouts/templates/application'
    
    def index
      @banners = KepplerBanners::Banner.all
      @services = KepplerServices::Service.all
      @testimonies = KepplerTestimonials::Testimony.all
    end

    def about
      @testimonies = KepplerTestimonials::Testimony.all
    end

    def services
      @services = KepplerServices::Service.all
    end

    def testimonials
      @testimonies = KepplerTestimonials::Testimony.all
    end


  end
end
