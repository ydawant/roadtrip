module SessionHelper
	def current_user
  	@current_user ||= Users.where(:id => session[:user_id]).first
	end

end
