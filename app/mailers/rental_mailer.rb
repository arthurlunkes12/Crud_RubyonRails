class RentalMailer < ApplicationMailer

  def confirmation(rental)
    @rental = rental
    mail(
      to: rental.user.email,
      subject: "Confirmação de aluguel"
    )
  end
  def cancelled(rental)
    @rental = rental
    mail(to: rental.user.email, subject: "Seu aluguel foi cancelado")
  end
  def ending_soon(rental)
    @rental = rental
    mail(
      to: rental.user.email,
      subject: "Seu aluguel termina amanhã"
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