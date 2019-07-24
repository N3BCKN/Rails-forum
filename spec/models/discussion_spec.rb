# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discussion, type: :model do
  discussion = Discussion.new(
    name: 'discussion name',
    content: 'discussion content',
    subject: Subject.new,
    user: User.new
  )

  describe 'validation' do
    it 'must be saved' do
      expect(discussion.save).to eq(true)
    end

    describe 'name' do
      it 'must be present' do
        discussion.name = nil
        expect(discussion).to_not be_valid
      end

      it 'must be longer or equal then 5 ' do
        discussion.name = '*' * 4
        expect(discussion).to_not be_valid
      end

      it 'must be shorter or equal then 30' do
        discussion.name = '*' * 31
        expect(discussion).to_not be_valid
      end
    end

    describe 'content' do
      it 'must be present' do
        discussion.content = nil
        expect(discussion).to_not be_valid
      end

      it 'must be longer or equal then 5' do
        discussion.content = '*' * 4
        expect(discussion).to_not be_valid
      end

      it 'must be shorter or equal then 5000' do
        discussion.content = '*' * 5001
        expect(discussion).to_not be_valid
      end
    end

    describe 'user' do
      it 'must be present' do
        discussion = Discussion.new(
          name: 'discussion name',
          content: 'discussion content',
          subject: Subject.new,
          user: nil
        )
        expect(discussion).to_not be_valid
      end
    end

    describe 'subject' do
      it 'must be present' do
        discussion = Discussion.new(
          name: 'discussion name',
          content: 'discussion content',
          subject: nil,
          user: User.new
        )
        expect(discussion).to_not be_valid
      end
    end
  end

  describe 'relations' do
    it 'should has many posts' do
      discussion = Discussion.reflect_on_association(:posts)
      expect(discussion.macro).to eq(:has_many)
    end

    it 'should belongs to user' do
      discussion = Discussion.reflect_on_association(:user)
      expect(discussion.macro).to eq(:belongs_to)
    end

    it 'should belongs to subject' do
      discussion = Discussion.reflect_on_association(:subject)
      expect(discussion.macro).to eq(:belongs_to)
    end
  end
end
