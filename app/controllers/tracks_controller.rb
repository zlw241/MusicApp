

class TracksController < ApplicationController
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
  def track_params
    params.require(:track).permit(:name, :length, :lyrics, :album_id, :bonus, :audio)
  end

end
