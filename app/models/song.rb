class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :release_year, presence: true, if: :released?
    validate :valid_release_year

    def valid_release_year
        if release_year.present? && release_year > Time.now.year
            errors.add(:release_year, "Year must be less than or equal to current year")
        end
    end
end