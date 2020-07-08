module ReviewsHelper
  def likes_count(review)
    pluralize(review.likes.size, 'like').to_s if review.likes.any?
  end

  def who_to_follow
    render partial: 'who_to_follow' unless current_user != @user
  end

  def author_name(review)
    link_to review.author.fullname.upcase, user_path(review.author)
  end
end
