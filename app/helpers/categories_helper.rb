# frozen_string_literal: true

module CategoriesHelper
  def all_posts(discussions)
    posts = 0
    discussions.each do |discussion|
      posts += discussion.posts.count
    end
    posts
  end
end
