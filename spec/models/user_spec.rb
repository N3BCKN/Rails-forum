# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user saving validation' do
    it 'ensure email pressence' do
      user = User.new(user_name: 'user_name', password: 'some_password').save
      expect(user).to eq(false)
    end

    it 'ensure user_name pressence' do
      user = User.new(email: 'testing@test.com', password: 'some_password').save
      expect(user).to eq(false)
    end

    it 'ensure password pressence' do
      user = User.new(email: 'testing@test.com', user_name: 'user_name').save
      expect(user).to eq(false)
    end

    it 'ensure user has been saved' do
      user = User.new(email: 'testing@test.com', user_name: 'user_name', password: 'some_password').save
      expect(user).to eq(true)
    end
  end
end
