class Post < ApplicationRecord
	belongs_to :discussion
	paginates_per 15
end
