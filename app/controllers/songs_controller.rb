class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        @song = find_song_id
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        @song = find_song_id

    end

    def update
        @song = find_song_id
        if @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song = find_song_id
        @song.destroy
        redirect_to songs_path
    end

    private

    def find_song_id
        Song.find(params[:id])
    end

    def song_params(*args)
        params.require(:song).permit(*args)
    end

end
