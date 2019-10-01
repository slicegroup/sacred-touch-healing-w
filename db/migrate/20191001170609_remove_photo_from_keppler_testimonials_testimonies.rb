class RemovePhotoFromKepplerTestimonialsTestimonies < ActiveRecord::Migration[5.2]
  def change
    remove_column :keppler_testimonials_testimonies, :photo, :string
  end
end
