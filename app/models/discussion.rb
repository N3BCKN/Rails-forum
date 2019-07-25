# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :content, presence: true, length: { minimum: 5, maximum: 5000 }
end
