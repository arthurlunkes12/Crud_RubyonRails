class RentalMailer < ApplicationMailer
  def confirmation_email(user)
    @user = user

    mail(
      to: @user.email,
      subject: "Confirmação da sua locação"
    )
  end
end
