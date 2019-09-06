class Song < ApplicationRecord

  validates :title, presence: true, 
  validates :title, uniqueness: { 
    scope: %i[release_year artist_name],
    message: 'Cannot be repeated by the same artist in the same year' 
  }

  validates :released, inclusion: { in: [true, false], message: "Must be true or false."  }
  validates :artist_name, presence: true

  # If released exists, release_year must be present and be less than or equal to current year
  # validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.new.year }, unless: ->(u){ u.released.blank? }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.new.year }, if: ->(u){ u.released == true }

end
