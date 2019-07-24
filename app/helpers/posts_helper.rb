# frozen_string_literal: true

module PostsHelper
  def user_avatar(user, width, height)
    if user.avatar.attached?
      image_tag user.avatar, style: "height:#{width}px;width:#{height}px;", class: 'img-fluid rounded-circle mt-3 ml-2'
    else
      image_tag 'default_avatar.png', style: "height:#{width}px;width:#{height}px;", class: 'img-fluid rounded-circle mt-3 ml-2'
    end
  end

  def user_avatar_tiny(user)
    if user.avatar.attached?
      image_tag user.avatar, style: 'height:30px;width:30px;', class: 'rounded-circle'
    else
      image_tag 'default_avatar.png', style: 'height:30px;width:30px;', class: 'rounded-circle'
    end
  end
end
