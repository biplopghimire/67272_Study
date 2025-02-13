class Faculty < ApplicationRecord
    # Relationships
    belongs_to :department
    has_many :assignments
    has_many :courses, through: :assignments
  
    # Scopes
    # 1. `alphabetical` [order]
    # 2. `active`       [where]
    scope :alphabetical, -> { order(:last_name, :first_name) }
    scope :active, -> { where(active: true) }


  
    # Validations
    # 1. must have first, last names
    # 2. rank must be either `Assistant Professor`, `Associate Professor`, or `Professor`
    validates_presence_of :first_name, :last_name
    validates_inclusion_of :rank, in: ['Assistant Professor', 'Associate Professor', 'Professor']
  
end
