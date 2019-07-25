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

  validates :user_name, presence: true, length: { minimum: 3, maximum: 15 } 

  has_attached_file :avatar, styles: { regular: "255x255>", medium: "150x150>", discussion: "120x120>", tiny: "30x30>" }, default_url: ":style/default_avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  private

  def assign_role
    self.role ||= :Regular if new_record?
  end
end
