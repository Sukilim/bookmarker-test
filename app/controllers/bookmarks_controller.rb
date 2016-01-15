class BookmarksController < ApplicationController
 before_action :authenticate_user!, except: :index
 before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  
  def index
    @bookmarks = current_user.bookmarks
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params.merge(user_id: current_user.id))
    if @bookmark.save
      redirect_to bookmarks_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark
    else
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end

    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end
end