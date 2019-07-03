class UsersController < ApplicationController
  def update
  	@user = current_user
  	if @user.update(user_params)
  		redirect_to profile_path(@user)
  	else
  		render 'profile/edit'
  	end
  end

  private
  def user_params

  	params.require(:user).permit(
  		:description,
  		:age,
  		:website,
  		:facebook,
  		:twitter,
  		:instagram,
  		:location,
  		:avatar
  	)
  end
end
