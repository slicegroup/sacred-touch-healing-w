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
    mount_uploaders :images, AttachmentUploader
    acts_as_list
    acts_as_paranoid

    def self.index_attributes
      %i[title]
    end
  end
end
