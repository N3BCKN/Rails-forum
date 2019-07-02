class Subject < ApplicationRecord
	belongs_to :category
	has_many :discussions
end
