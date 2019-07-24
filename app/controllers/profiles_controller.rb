# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :user_restrictions, only: [:edit]
  def show
    @profile = User.find(params[:id])
  end

  def edit; end

  private

  def user_restrictions
    @profile = User.find(params[:id])
    return false unless @profile == current_user
  end
end
