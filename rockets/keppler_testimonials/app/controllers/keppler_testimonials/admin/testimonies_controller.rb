
# frozen_string_literal: true

require_dependency "keppler_testimonials/application_controller"
module KepplerTestimonials
  module Admin
    # TestimoniesController
    class TestimoniesController < ::Admin::AdminController
      layout 'keppler_testimonials/admin/layouts/application'
      before_action :set_testimony, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /keppler_testimonials
      def index
        respond_to_formats(@testimonies)
        redirect_to_index(@objects)
      end

      # GET /keppler_testimonials/1
      def show; end

      # GET /keppler_testimonials/new
      def new
        @testimony = Testimony.new
      end

      # GET /keppler_testimonials/1/edit
      def edit; end

      # POST /keppler_testimonials
      def create
        @testimony = Testimony.new(testimony_params)

        if @testimony.save
          redirect(@testimony, params)
        else
          render :new
        end
      end

      # PATCH/PUT /keppler_testimonials/1
      def update
        if @testimony.update(testimony_params)
          redirect(@testimony, params)
        else
          render :edit
        end
      end

      def clone
        @testimony = Testimony.clone_record params[:testimony_id]
        @testimony.save
        redirect_to_index(@objects)
      end

      # DELETE /keppler_testimonials/1
      def destroy
        @testimony.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Testimony.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Testimony.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Testimony.sorter(params[:row])
      end

      private

      def index_variables
        @q = Testimony.ransack(params[:q])
        @testimonies = @q.result(distinct: true)
        @objects = @testimonies.page(@current_page).order(position: :asc)
        @total = @testimonies.size
        @attributes = Testimony.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_testimony
        @testimony = Testimony.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def testimony_params
        params.require(:testimony).permit(
          :name, :testimony
        )
      end
    end
  end
end
