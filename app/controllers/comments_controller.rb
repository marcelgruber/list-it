class CommentsController < ApplicationController
  #http_basic_authenticate_with name: "quipoil", password: "password", only: :destroy

  def create
    @listing = Listing.find(params[:listing_id])
    @comment = @listing.comments.create(comment_params)
    redirect_to listing_path(@listing)
  end

  def destroy
     @listing = Listing.find(params[:listing_id])
     @comment = @listing.comments.find(params[:id])
     @comment.destroy
     redirect_to listing_path(@listing)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
