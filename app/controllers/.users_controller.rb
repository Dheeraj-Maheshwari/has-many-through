class UsersController < ApplicationController
	def index

		@users = User.all

	end

	def new

		@user = User.new

	end

	def create
			@user=User.new(param_detail)
			if @user.save

				redirect_to users_path

			else

			render 'new'	
		end


	end


end

private 

def param_detail

	params.require(:user).permit(:first,:last,:email, buses_attributes:[:user_id,:_destroy,:bus])

end
