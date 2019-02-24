class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [ :edit, :update, :destroy]
  def index
    @songs = @artist.songs.all
    
  end

  def show
    
  end

  def new
    @song = @artist.songs.new
    render partial: "form"
  end

  def create
    @song = @artist.songs.new(songs_params)
    if @song.save
      redirect_to edit_artist_path(@artist)
    else
    
      render partial: "form"
    end
  end

  def edit
    render partial: "form"
  end

  def update
if @song.update(songs_params)
  redirect_to artist_songs_path
else
  render :edit
  end
end

def destroy
  @song.destroy
  redirect_to artist_songs_path
end


  private
  def set_artist
    @artist= Artist.find(params[:artist_id])
  end

  def set_song
    @song= Song.find(params[:id])
  end

  def songs_params
    
    params.require(:song).permit(:name, :genre)
    
  end

end
