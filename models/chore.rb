class Chore < ApplicationRecord
    belongs_to :child
    belongs_to :task

    validates_date :due_on

    scope :chronological, -> { order('due_on') }
    scope :pending, -> { where(completed: false) }
    scope :done, -> { where(completed: true) }
    scope :upcoming, -> { where('due_on >= ?', Date.today) }
    scope :past, -> { where('due_on < ?', Date.today) }
    scope :by_task, -> { joins(:task).order('name') }
    
    def status
        return self.completed ? "Completed" : "Pending"
    end

end
