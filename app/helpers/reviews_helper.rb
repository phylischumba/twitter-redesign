module ReviewsHelper
  def likes_count(review)
    if review.likes.any?
      "#{pluralize(review.likes.size, 'like')}" 
    end
  end

  def who_to_follow
    unless current_user != @user
      render partial: 'who_to_follow'
    end
  end
end
