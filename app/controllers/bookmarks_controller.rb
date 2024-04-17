class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to lists_path, notice: "bookmark was successfully created"
    else
      render :new
    end
  end

  def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
