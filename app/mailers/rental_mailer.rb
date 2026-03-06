class RentalMailer < ApplicationMailer

  def confirmation(rental)
    @rental = rental
    mail(
      to: rental.user.email,
      subject: "Confirmação de aluguel"
    )
  end

  def ending_soon(rental)
    @rental = rental
    mail(
      to: rental.user.email,
      subject: "Seu aluguel está acabando"
    )
  end

  def finished(rental)
    @rental = rental
    mail(
      to: rental.user.email,
      subject: "Aluguel finalizado"
    )
  end

end