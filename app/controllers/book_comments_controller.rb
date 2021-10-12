class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    # comment = Comment.new(book_comment_params)
    # comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
     BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    # comment.destroy
     redirect_back(fallback_location: root_path)
  end

   private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end

# find params[:id]
# find_by title: "タイトル" => title タイトル, body ~~
# where title: "test" => id:1 title test , id:2 title test (=> find_byの複数版)