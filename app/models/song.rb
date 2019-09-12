class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: -> { released == true }, 
    numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }, if: -> { released == true}
  validates :artist_name, presence: true
end
