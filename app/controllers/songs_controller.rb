class SongsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def song_params
    params.require(:song).permit(:name, :artist, :album, :text, :link, :tag).merge(user_id: current_user.id)
  end
end
