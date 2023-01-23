class SongsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @song_form = SongForm.new
  end

  def create
    @song_form = SongForm.new(song_form_params)
    if @song_form.valid?
      @song_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def song_form_params
    params.require(:song_form).permit(:name, :artist, :album, :text, :link, :tag_id).merge(user_id: current_user.id)
  end
end
