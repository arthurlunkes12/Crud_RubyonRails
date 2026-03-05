class VehiclesController < ApplicationController
    before_action :authenticate_user!
      load_and_authorize_resource

    def index
      
      if can? :manage, :all
        @q = Vehicle.ransack(params[:q])
        @vehicles = @q.result.page(params[:page]).per(5)
      else
        @q = Vehicle.where(status: 'available').ransack(params[:q])
        @vehicles = @q.result.page(params[:page]).per(5)
      end
      
      
    end

    def new
      @vehicle = Vehicle.new
    end

    def create
      @vehicle = current_user.vehicles.build(vehicle_params)

        if @vehicle.save
          redirect_to vehicle_path(@vehicle)
        else
          render :new 
         
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