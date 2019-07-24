# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    describe 'content' do
      it 'must be prestent' do
        post = Post.new(content: nil, user: User.new, discussion: Discussion.new)
        expect(post).to_not be_valid
      end

      it 'must be longer or equal to 4 ' do
        post = Post.new(content: '*' * 3, user: User.new, discussion: Discussion.new)
        expect(post).to_not be_valid
      end

      it 'must be shorter or equal to 5000' do
        post = Post.new(content: '*' * 5001, user: User.new, discussion: Discussion.new)
        expect(post).to_not be_valid
      end
    end

    describe 'user' do
      it 'must be prestent' do
        post = Post.new(content: 'post content', user: nil, discussion: Discussion.new)
        expect(post).to_not be_valid
      end
    end

    describe 'discussion' do
      it 'must be prestent' do
        post = Post.new(content: 'post content', user: User.new, discussion: nil)
        expect(post).to_not be_valid
      end
    end

    it 'should be saved' do
      post = Post.new(content: 'post content', user: User.new, discussion: Discussion.new)
      expect(post.save).to eq(true)
    end
  end

  describe 'relations' do
    it 'should belongs to user' do
      post = Post.reflect_on_association(:user)
      expect(post.macro).to eq(:belongs_to)
    end
    it 'should belongs to discussion' do
      post = Post.reflect_on_association(:discussion)
      expect(post.macro).to eq(:belongs_to)
    end
  end
end
