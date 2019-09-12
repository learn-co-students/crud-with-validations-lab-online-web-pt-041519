class SongsController < ApplicationController
    before_action :set_song!, only: [:show, :edit, :update, :destroy]

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(post_params(:title, :released, :release_year, :artist_name, :genre))
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
        
    end

    def show
    end

    def edit
    end

    def update
        @song.update(post_params(:title, :released, :release_year, :artist_name, :genre))
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def index
        @songs = Song.all
    end

    def destroy
        @song.destroy
        redirect_to songs_path
    end


    private

    def post_params(*args)
        params.require(:song).permit(*args)
    end

    def set_song!
        @song = Song.find(params[:id])
    end



end
