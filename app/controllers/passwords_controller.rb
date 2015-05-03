class PasswordsController < ApplicationController
	before_action :set_user, only: [:edit, :update]
  def new
  end

	def create
		user = User.find_by(email: params[:email])
		user.send_password_reset_instructions if user

		redirect_to root_url, info: "Email sent with password reset instructions"
	end

  def edit
  end

	def update
		if @user.has_valid_password_reset_token
			if @user.update(password_params)
				redirect_to sign_in_path, success: "Your password has been reset successfully"
			else 
				render :edit
			end
		else
			redirect_to new_password_path, warning: "Password reset has expired"
		end
	end

	private
		def set_user
			@user = User.find_by!(password_reset_token: params[:password_reset_token])
		end

		def password_params
			params.require(:user).permit(:password, :password_confirmation)
		end
end
