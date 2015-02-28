class SessionController < ApplicationController
  
  def new
    @user = current_user || Users.new
  end

	def login
		@user = Users.find_by_username(params[:username].downcase)
		if @user && @user.authenticate(params[:password])
    	session[:user_id] = @user.id
    	@session = session
    	@fail = false
    	redirect_to(journey_index_path)
  	else
  		print @user.errors.full_messages.last
    	@fail = true
    	redirect_to("/")
  	end
	end

  def logout
    session.clear
    redirect_to root_path
  end

end
