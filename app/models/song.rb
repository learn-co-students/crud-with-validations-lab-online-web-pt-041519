class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :artist_name, presence: true
    with_options if: :released? do |song|
        song.validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: Date.today.year }, presence: true
    end
end
