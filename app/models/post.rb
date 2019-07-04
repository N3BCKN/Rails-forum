class Post < ApplicationRecord
	belongs_to :discussion
	belongs_to :user
	paginates_per 15

	validates :content, presence: true, length: { minimum: 4, maximum: 5000 }
end
