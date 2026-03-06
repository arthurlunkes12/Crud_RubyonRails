class VehiclesController < ApplicationController
    before_action :authenticate_user!
      load_and_authorize_resource

  def index
    if can? :manage, :all
      @q = Vehicle.ransack(params[:q])
    else
      @q = Vehicle.left_joins(:rentals)
      .where("vehicles.status = ? OR rentals.user_id = ?", "available", current_user.id)
      .distinct
      .ransack(params[:q])
    end

    @vehicles = @q.result.page(params[:page]).per(5)
  end

    def new
      @vehicle = Vehicle.new
    end

    def create
      @vehicle = Vehicle.new(vehicle_params)
      @vehicle.status = "available"

      if @vehicle.save
        redirect_to vehicles_path, notice: "Vehicle criado com sucesso!"
      else
        puts @vehicle.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    end
    
    def show
        @vehicle = Vehicle.find(params[:id])
    end

    def edit
        @vehicle = Vehicle.find(params[:id])
    end

    def update

        @vehicle = Vehicle.find(params[:id])

        if @vehicle.update(vehicle_params)
            redirect_to vehicles_path(@vehicle)
        else
            render :edit
        end
    end

  def rent
    @vehicle = Vehicle.find(params[:id])

    if @vehicle.status == "available"

      duration = params[:duration].to_i
      duration = 7 if duration > 7
      duration = 1 if duration < 1

      rental = Rental.create!(
        user: current_user,
        vehicle: @vehicle,
        start_date: Date.today,
        end_date: Date.today + duration.days
      )

      @vehicle.update!(status: "rented")

      RentalMailer.confirmation(rental).deliver_now

      redirect_to vehicles_path, notice: "Veículo alugado por #{duration} dias!"
    end
  end

    def destroy
       @vehicle = Vehicle.find(params[:id])
       
       @vehicle.destroy

       redirect_to vehicles_path
    end

    private

    def vehicle_params
        params.require(:vehicle).permit(:brand, :model, :year, :plate)
    end  
    
end