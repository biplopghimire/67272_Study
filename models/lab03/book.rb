class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors
  
  # validate units_sold is a number, and is greater than or equal to 0, and an integer
  validates :units_sold, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :title, presence: true

  #Using validates_timeliness gem, add a validation so that the proposal_date is a legitimate date and that it is either the current date or some time in the past.
  validates_date :proposal_date, on_or_before: lambda { Date.current }

  #Using validates_timeliness gem, add a validation so that the contract_date is also a legitimate date and that it is either the current date or some time in the past. This date might be blank.
  validates_date :contract_date, on_or_before: lambda { Date.current }, allow_blank: true

  #Also make sure that the contract_date is some time after the proposal_date as you can't sign contracts for books yet to be proposed.
  validates_date :contract_date, after: :proposal_date, allow_blank: true

  #Add a validation so that the published_date is also a legitimate date and that it is either the current date or some time in the past.
  validates_date :published_date, on_or_before: lambda { Date.current }

  #Also make sure that the published_date is some time after the contract_date as you can't publish books without contracts.
  validates_date :published_date, after: :contract_date

  #Finally allow the published_date to be blank as not all books we are tracking are published yet.
  validates_date :published_date, allow_blank: true


  # scope that returns books in alphabetical order
  scope :alphabetical, -> { order(:title) }
end
