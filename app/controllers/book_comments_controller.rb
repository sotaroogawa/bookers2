class BookCommentsController < ApplicationController
  def create
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = params[:book_id]
    @book_comment.save
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
  end

   private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end

# find params[:id]
# find_by title: "タイトル" => title タイトル, body ~~
# where title: "test" => id:1 title test , id:2 title test (=> find_byの複数版)