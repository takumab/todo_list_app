class Task < ApplicationRecord
  belongs_to :todo_list

  scope :not_completed,  -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }

  validates :description, presence: true
end
