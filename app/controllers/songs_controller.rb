class SongsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
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

  def show
  end

  def edit
    song_attributes = @song.attributes
    @song_form = SongForm.new(song_attributes)
  end

  def update
    @song_form = SongForm.new(song_form_params)
    if @song_form.valid?
      @song_form.update(song_form_params, @song)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to root_path
  end

  private
  def song_form_params
    params.require(:song_form).permit(:name, :artist, :album, :text, :tag_name, :link).merge(user_id: current_user.id)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
