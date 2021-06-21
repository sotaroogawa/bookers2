class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @user = @book.user
    @book_new = Book.new
  end

  def create
    @book_new = Book.new(book_params)
    @user = current_user
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book_new)
    else
      flash[:notice] = "erorr"
      @books = Book.all
      render :index
    end
  end

  def edit
     @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "update action was successfully"
      redirect_to book_path
    else
      flash[:notice] = "update error"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
