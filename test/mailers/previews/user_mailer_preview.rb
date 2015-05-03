# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset_instructions
  def password_reset_instructions
    UserMailer.password_reset_instructions
  end

end
