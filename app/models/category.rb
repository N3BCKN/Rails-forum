# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :subjects

  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
end
