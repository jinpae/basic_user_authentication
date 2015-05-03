class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset_instructions.subject
  #
  def password_reset_instructions(user)
		@user = user

    mail to: user.email, subject: "Password reset instructions"
  end
end
