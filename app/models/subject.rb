class Subject < ApplicationRecord
	belongs_to :category
	has_many :discussions
	paginates_per 20
end
