module ApplicationHelper
  def sample_helper
    "<p>My helper method</p>".html_safe
  end

  def login_helper
    if current_user.is_a?(User)
    link_to "logout", destroy_user_session_path, method: :delete
    else
    (link_to "register", new_user_registration_path) +
    " ".html_safe +
    (link_to "login", new_user_session_path)
  end
end
end
