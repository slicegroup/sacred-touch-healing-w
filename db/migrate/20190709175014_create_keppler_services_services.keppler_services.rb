# This migration comes from keppler_services (originally 20190709175012)
class CreateKepplerServicesServices < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_services_services do |t|
      t.string :title
      t.text :description_en
      t.text :description_es
      t.jsonb :images
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
