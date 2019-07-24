# frozen_string_literal: true

class DiscussionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @discussion = Discussion.find(params[:id])
    @posts = @discussion.posts.page params[:page]
    @post = current_user.posts.build if current_user
  end

  def new
    @discussion = current_user.discussions.build
  end

  def create
    @subject = Subject.find(params[:discussion][:subject])
    @discussion = current_user.discussions.build(discussion_params)
    @discussion.subject = @subject
    respond_to do |format|
      if @discussion.save
        format.html do
          redirect_to discussion_path(@discussion)
        end
      else
        format.html do
          render 'new'
        end
      end
    end
  end

  def edit; end

  def update; end

  def destroy; end

  def search
    if params[:q].present?
      @discussions = Discussion.where('LOWER(name) LIKE ?', "%#{params[:q].downcase}%")
    else
      @discussions = nil
    end
  end

  private

  def discussion_params
    params.require(:discussion).permit(:name, :content)
  end
end
