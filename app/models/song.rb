class Song < ApplicationRecord

  validates :title, presence: true
  validates :title, uniqueness: true, if: :artist_year_check
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_requirements
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, allow_nil: true
  validates :artist_name, presence: true

  private

  def artist_year_check
    self.class.all.any? { |s| s.title == self.title && s.artist_name == self.artist_name && s.release_year == self.release_year }
  end

  def release_year_requirements
    if self.release_year == nil && self.released == true
      errors.add(:release_year, "Release year required if song has been released.")
    end

  end

end
