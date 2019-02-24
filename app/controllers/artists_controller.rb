class ArtistsController < ApplicationController
  before_action :set_artist, only: [ :show, :edit, :update, :destroy]
  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
    render partial: "form"
  end

  def create
    @artist = Artist.new(artist_params)
    
    if @artist.save
      redirect_to admins_path
    else
      render partial: "form"
    end
  end

  def edit
    render partial: "form"
  end

  def update
if @artist.update(artist_params)
  redirect_to admins_path
else
  render :form
  end
end

def destroy
  @artist.destroy
  redirect_to admins_path
end


  private
  def set_artist
    @artist= Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre)
  end

end
