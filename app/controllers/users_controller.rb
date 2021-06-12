class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book_new = Book.new
  end


  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
      flash[:notice] = "update action was successfully"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "update error"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end

end