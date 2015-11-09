class UsersController < ApplicationController
  include ApplicationHelper

  def show
    @user = User.find(params[:id])
    #debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(assn_params)
    if @user.save
      flash_add(:success, "User " + @user.username + " was successfully created!")
      redirect_to root_path
    else
      flash_add(:danger, "User did not save correctly, see errors")
      render 'new'
    end
  end

  def index
    redirect_to :back
  end

  private
    def assn_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
