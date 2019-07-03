class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :recent_discussions

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  # def recent_discussions
  # 	@recent_discussions = Discussion.all.order("created_at DESC").limit(5)
  # end
end
