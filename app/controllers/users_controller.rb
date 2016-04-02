class UsersController < ApplicationController

# to list all the images in asc order of their position
  def index
	 @users = User.all.order(:position)
  end

# to pass a user object to view so as help storing it in db
  def new
	@user = User.new
  end

# to save the user input value in database
  def create
	@user = User.new(user_params)
    if @user.save
        redirect_to users_path
    else
        redirect_to new_user_path, alert: "Error creating user."
    end
  end

# to show one particular image, currently this action is not called in our flow
  def show
	@users = User.find(params[:id])
  end

#rails 4 have a strong parameter concept to prevent mass assignment hence we need 
#assign permision to parameters which can be assigned
private
  def user_params
    params.require(:user).permit(:url, :position)
  end
end
