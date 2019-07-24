# frozen_string_literal: true

class AddContentToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :content, :text
  end
end
