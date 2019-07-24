# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :category
  has_many :discussions
  paginates_per 20

  validates :name, presence: true, length: { minimum: 5, maximum: 40 }
end
