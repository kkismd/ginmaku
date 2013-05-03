# encode: utf-8
class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json
  def index
    @song_search_form = SongSearchForm.new(params[:song_search_form])
    @recents = Song.recents

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  def list
    @songs = Song.order('id').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  def list_all
    @songs = Song.order('id')
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/detail
  def detail
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # detail.html.erb
      format.json { render json: @song }
    end
  end

  def preview
    @song = Song.new(words:params[:words])
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])
    @song.romanize!

    respond_to do |format|
      if @song.save
        format.html { redirect_to edit_song_path(@song), notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])
    song_attributes = params[:song]
    is_roman_button = (params[:button] == 'roman')
    is_saved = @song.update_with(is_roman_button, song_attributes)

    respond_to do |format|
      if is_saved
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  def search
    @song_search_form = SongSearchForm.new(params[:song_search_form])
    @songs = @song_search_form.search.page(params[:page])
  end
end
