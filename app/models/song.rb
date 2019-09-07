class Song < ApplicationRecord
   validates :title, presence: {message: "Cannot be blank"}
   validates :title, uniqueness: {scope: %i[release_year artist_name],
   message: "a title cannot exist twice in the same year!"}
   validates :released, inclusion: {in: [true, false]}
   validates :artist_name, presence: {message: "Artist name cannot be blank"}


   with_options if: :released? do |song|
      song.validates :release_year, presence: true
      song.validates :release_year, numericality: {
        less_than_or_equal_to: Date.today.year
      }
    end
  
    # released helper 
    def released?
      released
    end


end
