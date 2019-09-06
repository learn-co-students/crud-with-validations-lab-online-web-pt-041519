class Song < ApplicationRecord

  validates :title, presence: true, uniqueness: { scope: :release_year, message: "Cannot duplicate titles in the same release year." }

  # validates :released, inclusion: { in: %w(true false), message: "%{value} is not true or false" }
  validates :released, inclusion: { in: [true, false], message: "Must be true or false."  }

  # If released exists, release_year must be present and be less than or equal to current year
  # validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.new.year }, unless: ->(u){ u.released.blank? }

  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.new.year }, if: ->(u){ u.released == true }

  validates :artist_name, presence: true
  # validates :genre, presence: true

end
