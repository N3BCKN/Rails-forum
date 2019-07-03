class Post < ApplicationRecord
	belongs_to :discussion
	belongs_to :user
	paginates_per 15
end
