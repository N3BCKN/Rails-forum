# frozen_string_literal: true

class AddDiscussionIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :discussion, foreign_key: true
  end
end
