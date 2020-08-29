class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:new, :index, :show, :edit]

	def index
		@users = User.all
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
		unless @user == current_user
			redirect_to user_path(current_user)
		 end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user), notice: "User info was successfully updated."
		else
			render :edit
		end
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to '/books/show', notice: "User info was successfully created."
		else
			@books = Book.all
			flash.now[:alert] = 'error'
			render :index
		end
    end

    def books
    	@users = User.all
    	@book = Book.new
    	@book = Book.all
    end

  private

   def user_params
   	   params.require(:user).permit(:name, :introduction, :image)
   end
end
