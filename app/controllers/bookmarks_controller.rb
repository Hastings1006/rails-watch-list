class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to root_path, notice: "bookmark added"
    else
      render :new, status: :unprocessable_entity
    end
  end

   def destroy
    # @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path, notice: 'Bookmark deleted successfully.'
  end


  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
