class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :released, presence: true
    validates :artist_name, presence: true
    # validate :released_year_specs

    def release_year_specs
        # Optional if released is false
        # Must not be blank if released is true
        # Must be less than or equal to the current year
    end


end
