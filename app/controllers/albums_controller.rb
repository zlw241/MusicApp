

class AlbumsController < ApplicationController
  before_action :ensure_logged_in

  def index
  end

  def show
  end

  def destroy
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  def album_params
    params.require(:album).permit(:title, :artist_id)
  end
end
