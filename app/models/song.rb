class Song < ApplicationRecord
  #this lab isn't fun.

  # is invalid without title
  validates :title, presence: true
    # is invalid if an artist tries to release the same song twice in a year
  validates :title, uniqueness: { scope: %i[release_year artist_name]}
  #validates :released, inclusion: { in: [ true, false ] }

  # is invalid without release year when released is true
  # is invalid when the release year is in the future
  # if realease_year == true
  validates :release_year, presence: true, if: :released? ,numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }



end
