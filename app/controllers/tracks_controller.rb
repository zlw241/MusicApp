

class TracksController < ApplicationController
  before_action :ensure_logged_in

  def index
  end

  def show
    @track = Track.find_by(id: params[:id])
    if @track
      render :show
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    album = track.album
    Track.delete(params[:id])
    redirect_to album_url(album)

  end

  def new
    render :new
  end

  def create
    @track = Album.find_by(id: params[:album_id]).tracks.new(track_params)
    if @track.save
      redirect_to album_url(@track.album)
    else
      flash[:errors] = @track.errors.full_messages
      render :new
    end

  end

  def edit
  end

  def update
  end

  private
  def track_params
    params.require(:track).permit(:name, :length, :lyrics, :album_id, :bonus, :audio)
  end

end
