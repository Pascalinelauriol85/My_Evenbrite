class UsersController < ApplicationController
  def show 
    @user = User.find(current_user.id)
  end

  def new
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(current_user)
    redirect_to user_path(current_user.id), notice: "Ton profil '#{@user.first_name.capitalize}' a bien été actualisé !"
    else
      flash.now[:messages] = @user.errors.full_messages
      render :edit
    end  
  end 

end
