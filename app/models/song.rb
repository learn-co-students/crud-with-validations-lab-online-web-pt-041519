class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true, unless: :artist_has_title?
    validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year },
        unless: Proc.new { |a| a.released == false } 
    validates :artist_name, presence: true


    def artist_has_title?
        bool = true
        Song.all.each do |song|
            if song.title == self.title
                if song.artist_name == self.artist_name && song.release_year == self.release_year
                    bool = false
                end
            end
        end
        bool
    end
end
