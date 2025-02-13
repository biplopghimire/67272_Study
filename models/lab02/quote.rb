class Quote < ApplicationRecord
    # Returns a random Quote object from the database
    validates_presence_of :body
    validates_presence_of :source
    def self.get_random_quote
      Quote.order("RANDOM()").first
    end
end
