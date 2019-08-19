# frozen_string_literal: true

module KepplerBanners
  # Banner Model
  class Banner < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    mount_uploader :image, AttachmentUploader
    acts_as_list
    acts_as_paranoid
    validates_presence_of :image, :title, :subtitle

    validate  :check_dimensions, :on => [:create, :update]

    def check_dimensions
      return if image_cache.nil?
      if (image.width < 840 || image.width > 840) && ( image.height < 560 || image.height > 560)
        errors.add :image, "Dimensión incorrecta <br/> El tamaño de la imágen cargada es de: #{image.width}x#{image.height} y no cumple con las dimensiones recomendadas".html_safe
      end
    end

    def self.index_attributes
      %i[title subtitle image]
    end
  end
end
