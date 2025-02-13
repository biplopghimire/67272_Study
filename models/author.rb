class Author < ApplicationRecord
    has_many :books_authors
    has_many :books, through: :book_authors


    validates_presence_of :first_name, :last_name
    # scope that returns authors in alphabetical order
    scope :alphabetical, -> { order('last_name, first_name') }

    # name method that returns the full name of the author, last name first
    def name
        "#{last_name}, #{first_name}"
    end



end
