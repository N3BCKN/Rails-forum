class BansController < ApplicationController
	before_action :authenticate_user!
	before_action :check_user

	def update
		@user = User.find(params[:profile_id])
		@is_ban
		if @user.role == "Regular"
			@user.role = "Banned"
			@is_ban = true
		else
			@user.role = "Regular"
			@is_ban = false
		end
		@user.save!

		respond_to do |format|
	      format.js
	    end
	end

	private
	def check_user
		redirect_to root_path unless current_user.role == "Admin"
	end
end
