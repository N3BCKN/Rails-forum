class PagesController < ApplicationController
  def index
  	@categories = Category.all.order('created_at ASC')
  end

  def faq
  end
end
