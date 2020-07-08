module UsersHelper

  def current_user_name
    current_user.fullname.upcase
  end

  def following_count
    current_user.following.count
  end

  def follower_count
    current_user.followers.count
  end

  def login_signup
    if logged_in?
      link_to 'Back', users_path, class: "form-control"
    elsif !logged_in?
      link_to 'Back', login_path, class: "form-control col-md-3 text-white  mx-auto text-center bg-secondary"
    end
  end

  def page_error(page)
    if page.errors.any?
    render partial: 'errors' 
    end
  end

  def user_name(user)
    link_to user.fullname, user_path(user)
  end

end
