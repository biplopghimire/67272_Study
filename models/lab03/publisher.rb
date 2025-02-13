class Publisher < ApplicationRecord
    has_many :books

    validates_presence_of :name

    scope :alphabetical, -> { order('name') }

end
