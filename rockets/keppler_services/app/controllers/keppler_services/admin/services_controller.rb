
# frozen_string_literal: true

require_dependency "keppler_services/application_controller"
module KepplerServices
  module Admin
    # ServicesController
    class ServicesController < ::Admin::AdminController
      layout 'keppler_services/admin/layouts/application'
      before_action :set_service, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /keppler_services
      def index
        respond_to_formats(@services)
        redirect_to_index(@objects)
      end

      # GET /keppler_services/1
      def show; end

      # GET /keppler_services/new
      def new
        @service = Service.new
      end

      # GET /keppler_services/1/edit
      def edit; end

      # POST /keppler_services
      def create
        @service = Service.new(service_params)

        if @service.save
          redirect(@service, params)
        else
          render :new
        end
      end

      # PATCH/PUT /keppler_services/1
      def update
        if @service.update(service_params)
          redirect(@service, params)
        else
          render :edit
        end
      end

      def clone
        @service = Service.clone_record params[:service_id]
        @service.save
        redirect_to_index(@objects)
      end

      # DELETE /keppler_services/1
      def destroy
        @service.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Service.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Service.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Service.sorter(params[:row])
      end

      private

      def index_variables
        @q = Service.ransack(params[:q])
        @services = @q.result(distinct: true)
        @objects = @services.page(@current_page).order(position: :asc)
        @total = @services.size
        @attributes = Service.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_service
        @service = Service.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def service_params
        params.require(:service).permit(
          :title, :description_en, :description_es, :images
        )
      end
    end
  end
end
