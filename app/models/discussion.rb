class Discussion < ApplicationRecord
	belongs_to :subject
	belongs_to :user
	has_many :posts, dependent: :destroy
end
