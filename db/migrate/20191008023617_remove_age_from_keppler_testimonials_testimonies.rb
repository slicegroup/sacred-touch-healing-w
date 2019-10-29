class RemoveAgeFromKepplerTestimonialsTestimonies < ActiveRecord::Migration[5.2]
  def change
    remove_column :keppler_testimonials_testimonies, :age, :integer
  end
end
