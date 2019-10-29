# This migration comes from keppler_services (originally 20190819193549)
class CreateKepplerServicesServices < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_services_services do |t|
      t.string :index
      t.string :title
      t.text :description
      t.string :banner
      t.string :image
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
