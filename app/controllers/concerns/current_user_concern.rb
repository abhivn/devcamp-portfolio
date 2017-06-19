module CurrentUserConcern

  extend ActiveSupport::Concern

  included do
    before_filter :current_user
  end

  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest user"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@gmail.com"
    guest
  end
end
