

class ArtistsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @artists = Artist.all
    render :index
  end

  def show
    @artist = Artist.find_by(id: params[:id])
    if @artist
      render :show
    else
      redirect_to artists_url
    end
  end

  def destroy
  end

  def new
    render :new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_url(@artist)
    else
      flash[:error] = @artist.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :genre)
  end

end
