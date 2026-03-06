namespace :rentals do

  desc "Envia aviso de aluguel terminando"
  task send_warning: :environment do
    rentals = Rental.where(end_date: nil)
                    .where(start_date: Date.today - 6)

    rentals.each do |rental|
      RentalMailer.ending_soon(rental).deliver_now
      puts "Aviso enviado para #{rental.user.email}"
    end
  end


  desc "Finaliza alugueis com 7 dias"
  task finish_rentals: :environment do
    rentals = Rental.where(end_date: nil)
                    .where(start_date: Date.today - 7)

    rentals.each do |rental|
      rental.update(end_date: Date.today)
      rental.vehicle.update(status: "available")

      RentalMailer.finished(rental).deliver_now

      puts "Aluguel finalizado para #{rental.user.email}"
    end
  end

end