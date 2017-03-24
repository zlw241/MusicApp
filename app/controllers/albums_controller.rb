

class AlbumsController < ApplicationController
  before_action :ensure_logged_in

  def index
  end

  def show
    @album = Album.find_by(id: params[:id])
    if @album
      render :show
    else
      render text: "no album found"
    end
  end

  def destroy
  end

  def new
    render :new
  end

  def create
    @album = Artist.find_by(id: params[:artist_id]).albums.new(album_params)
    if @album.save
      render :show
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def album_params
    params.require(:album).permit(:title, :year)
  end
end
