class UsersController < ApplicationController
	
	def new
		@user = Users.new
	end

	def create
 		@user = Users.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to(journey_index_path)
    else
    	print @user.errors.full_messages.last
      redirect_to :back
    end
	end

	private
  def user_params
    params.require(:users).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end

end
