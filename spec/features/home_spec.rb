require 'rails_helper'

RSpec.describe 'home' do
	it 'displays the header of the forum' do
		visit('/')
		expect(page).to have_content("Enjoy your interesting discussions")
	end 
end