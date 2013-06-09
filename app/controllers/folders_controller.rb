class FoldersController < ApplicationController

  def set_current
    logger.debug(params.inspect)
    session[:current_folder] = params[:f].to_i
    render :text => 'ok'
  end

  # GET /folders/1/content
  def content
    @folder = Folder.find(params[:id])
    render partial: 'content_bookmarks'
  end

  # GET /folders
  # GET /folders.json
  def index
    @folders = Folder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folders }
    end
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    @folder = Folder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/new
  # GET /folders/new.json
  def new
    @folder = Folder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/1/edit
  def edit
    @folder = Folder.find(params[:id])
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.make(params[:folder])

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        format.json { render json: @folder, status: :created, location: @folder }
      else
        format.html { render action: "new" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_remote
    @folder = Folder.make(params[:folder])
    @folder.save
    render :partial => 'shared/bookmark'
  end

  def reorder
    logger.error params[:bm].inspect
    folder = Folder.find params[:id]
    folder.reorder params[:bm]
    render text: 'ok'
  end

  # PUT /folders/1
  # PUT /folders/1.json
  def update
    @folder = Folder.find(params[:id])
    if params[:folder_content_bookmarks].present?
      bms = params[:folder_content_bookmarks].split(/,/).map do |str|
        str.gsub(/bm_/, '').to_i
      end
      @folder.reorder(bms)
    end

    attr = params[:folder].dup
    if attr[:title_date].present?
      attr[:title] = attr[:title_date] + ' ' + attr[:title]
    end
    attr.delete(:title_date)

    respond_to do |format|
      if @folder.update_attributes(attr)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url }
      format.json { head :no_content }
    end
  end
end
