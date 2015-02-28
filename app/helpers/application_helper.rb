module ApplicationHelper

  def current_user
    @_current_user ||= session[:current_user_id] &&
                       Users.find_by_id(session[:current_user_id])
  end

end
