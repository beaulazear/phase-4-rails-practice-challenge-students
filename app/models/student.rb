class Student < ApplicationRecord
  belongs_to :instructor
  validates :name, presence: true
  validates :age, exclusion: { in: 1..18 }
end
