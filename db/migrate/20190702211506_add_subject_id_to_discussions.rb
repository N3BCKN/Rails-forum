# frozen_string_literal: true

class AddSubjectIdToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_reference :discussions, :subject, foreign_key: true
  end
end
