# frozen_string_literal: true

class AddCateogryIdToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :subjects, :category, foreign_key: true
  end
end
