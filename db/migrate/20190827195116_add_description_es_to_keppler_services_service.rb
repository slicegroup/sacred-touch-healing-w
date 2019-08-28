class AddDescriptionEsToKepplerServicesService < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_services_services, :description_es, :text
  end
end
