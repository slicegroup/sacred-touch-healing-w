class AddPhotoKepplerTestimonialsTestimonies < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_testimonials_testimonies, :photo, :string
  end
end
