class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, if: :released?
  validate :good_year





  def good_year
    if release_year.present? && release_year > Time.now.year
        errors.add(:release_year, "Year must be less than or equal to current year")
    end
  end

end
