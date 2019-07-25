# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]
  before_action :authenticate_user!

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  def show
    @conversation = Conversation.find_by(id: params[:id])
    @personal_message = PersonalMessage.new
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless @conversation&.participates?(current_user)
  end
end
