class UserNotifierMailer < ApplicationMailer
  default from: 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_login_email(user, device, login)
    @user = user
    @login = login
    @device = device
    mail(to: @user.try(:email),
         subject: 'Nuevo inicio de sesión')
  end
end
