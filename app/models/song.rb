class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :title, uniqueness: { scope: %i[release_year artist_name], message: 'Cannot release the same song twice in a year'}
    validate :blank_year
    validate :invalid_release_year

    def blank_year
        if released && release_year.blank?
            errors.add(:blank_year, "The release year cannot be blank")
          end
    end

    def invalid_release_year
        if release_year.present? && release_year > Date.today.year
            errors.add(:invalid_release_year, "The release year must not be in the future")
        end
    end
      
end