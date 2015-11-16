class BookmarksController < ApplicationController

  # GET /bookmarks
  def index
    if logged_in?
      @bookmarks = Bookmark.all  
    else
      # byebug
      redirect_to new_session_path
    end
  end

  # GET /bookmarks/1
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  def create

    @bookmark = Bookmark.new(url: params[:bookmark][:url], user_id: current_user.id)
# byebug

    if @bookmark.save
      redirect_to bookmarks_path
    end
  end

  # PATCH/PUT /bookmarks/1
  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: 'Bookmark was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bookmark_params
      params.require(:bookmark).permit(:url).merge!(user_id: current_user.id)
    end
end
