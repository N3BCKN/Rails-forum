class Discussion < ApplicationRecord
	belongs_to :subject
	has_many :posts, dependent: :destroy
end
