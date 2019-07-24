# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: %w[Admin Moderator Regular Banned]
  before_create :assign_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :discussions

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :personal_messages, dependent: :destroy

  has_one_attached :avatar

  validates :user_name, presence: true, length: { minimum: 3, maximum: 15 }

  private

  def assign_role
    self.role ||= :Regular if new_record?
  end
end
