class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: %i[release_year artist_name],
    message: "Cannot be repeated by the same artist in the same year" }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }, if: :released?
    validates :artist_name, presence: true
    validates :genre, presence: true
end
