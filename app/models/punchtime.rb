class Punchtime < ApplicationRecord
  belongs_to :user

  validates :punch_type, presence: true
  validates :time, presence: true
end
