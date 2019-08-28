# frozen_string_literal: true

module KepplerServices
  # Service Model
  class Service < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    mount_uploader :banner, AttachmentUploader
    mount_uploader :image, AttachmentUploader
    mount_uploader :index, AttachmentUploader
    validates_presence_of :image, :title, :description, :index, :banner, :description_es
    acts_as_list
    acts_as_paranoid

    validate  :check_dimensions_index, :on => [:create, :update]

    def check_dimensions_index
      return if index_cache.nil?
      # if (index.width < 390 || index.width > 390) && ( index.height < 210 || index.height > 210)
      #   errors.add :index, "Dimensión incorrecta <br/> El tamaño de la imágen cargada es de: #{index.width}x#{index.height} y no cumple con las dimensiones recomendadas".html_safe
      # end
    end

    validate  :check_dimensions_banner, :on => [:create, :update]

    def check_dimensions_banner
      return if banner_cache.nil?
      # if (banner.width < 1359 || banner.width > 1359) && ( banner.height < 445 || banner.height > 445)
      #   errors.add :banner, "Dimensión incorrecta <br/> El tamaño de la imágen cargada es de: #{banner.width}x#{banner.height} y no cumple con las dimensiones recomendadas".html_safe
      # end
    end

    validate  :check_dimensions_image, :on => [:create, :update]

    def check_dimensions_image
      return if image_cache.nil?
      # if (image.width < 500 || image.width > 500) && ( image.height < 500 || image.height > 500)
      #   errors.add :image, "Dimensión incorrecta <br/> El tamaño de la imágen cargada es de: #{image.width}x#{image.height} y no cumple con las dimensiones recomendadas".html_safe
      # end
    end

    def self.index_attributes
      %i[index title description]
    end
  end
end
