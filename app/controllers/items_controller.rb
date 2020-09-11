class ItemsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    if @user.valid?
      @user.save
      return redirect_to root_path
    else
      render "new"
    end
end
