# frozen_string_literal: true

module KepplerTestimonials
  # Testimony Model
  class Testimony < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    mount_uploader :photo, AttachmentUploader
    acts_as_list
    acts_as_paranoid
    validates_presence_of :name, :photo, :testimony
    
    validate  :check_dimensions, :on => [:create, :update]

    # def check_dimensions
    #   return if photo_cache.nil?
    #   if (photo.width < 85 || photo.width > 85) && ( photo.height < 65 || photo.height > 65)
    #     errors.add :photo, "Dimensión incorrecta <br/> El tamaño de la imágen cargada es de: #{photo.width}x#{photo.height} y no cumple con las dimensiones recomendadas".html_safe
    #   end
    # end

    def self.index_attributes
      %i[name]
    end
  end
end
