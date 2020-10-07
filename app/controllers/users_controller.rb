class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @prptotypes = user.prototypes

    @user = User.find(params[:id])

    
  end

end
