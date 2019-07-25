# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'validation' do
    subject { Subject.new(name: nil, category: Category.new) }

    it 'must be saved' do
      subject = Subject.new(name: 'subject name', category: Category.new).save
      expect(subject).to eq(true)
    end

    describe 'name' do
      it 'must be present' do
        expect(subject).to_not be_valid
      end

      it 'must be not longer then 30 chars' do
        subject.name = '*' * 31
        expect(subject).to_not be_valid
      end

      it 'must be not shorter then 5 chars' do
        subject.name = '*' * 4
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'relations' do
    it 'should belongs to category' do
      subject = Subject.reflect_on_association(:category)
      expect(subject.macro).to eq(:belongs_to)
    end

    it 'should has many discussions' do
      subject = Subject.reflect_on_association(:discussions)
      expect(subject.macro).to eq(:has_many)
    end
  end
end
