

class ArtistsController < ApplicationController
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
  def artist_params
    params.require(:artist).permit(:name)
  end

end
