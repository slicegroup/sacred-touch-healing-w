# This migration comes from keppler_testimonials (originally 20190709181208)
class CreateKepplerTestimonialsTestimonies < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_testimonials_testimonies do |t|
      t.string :name
      t.text :testimony
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
