# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validation' do
    describe 'name' do
      it 'must be present' do
        category = Category.new(name: nil)
        expect(category).to_not be_valid
      end

      it 'must be longer or equal 5 chars' do
        category = Category.new(name: '*' * 4)
        expect(category).to_not be_valid
      end

      it 'must be shorter or equal 30 chars' do
        category = Category.new(name: '*' * 31)
        expect(category).to_not be_valid
      end
    end

    it 'must be saved' do
      category = Category.new(name: 'category name').save
      expect(category).to eq(true)
    end
  end

  describe 'relations' do
    it 'should have many subjects' do
      category = Category.reflect_on_association(:subjects)
      expect(category.macro).to eq(:has_many)
    end
  end
end
