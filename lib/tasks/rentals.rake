namespace :rentals do

  desc "Envia aviso de aluguel terminando"
  task send_warning: :environment do

    rentals = Rental.where(end_date: Date.tomorrow)

    rentals.find_each do |rental|
      RentalMailer.ending_soon(rental).deliver_now
      puts "Aviso enviado para #{rental.user.email}"
    end

  end


  desc "Finaliza alugueis vencidos"
  task finish_rentals: :environment do

    rentals = Rental.where("end_date <= ?", Date.today)
                    .joins(:vehicle)
                    .where(vehicles: { status: "rented" })

    rentals.find_each do |rental|
      rental.vehicle.update!(status: "available")

      RentalMailer.finished(rental).deliver_now

      puts "Aluguel finalizado para #{rental.user.email}"
    end

  end

end