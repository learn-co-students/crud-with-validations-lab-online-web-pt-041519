class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: %i[release_year artist_name], message: "Cannot be repeated" }
  validates :released, inclusion: { in: [true, false], message: "Must be true or false" }
  validates :release_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }, if: :released?
  validates :artist_name, presence: true

  def released?
    released
  end

end
