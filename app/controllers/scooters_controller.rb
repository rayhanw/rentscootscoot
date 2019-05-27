class ScootersController < ApplicationController
  def index
    @scooters = Scooter.all
  end

  def show
    @scooter = Scooter.find(params[:id])
  end

  def new
    @scooter = Scooter.new
  end

  def create
    @scooter = Scooter.new(scooter_params)
    @scooter.save
    redirect_to scooter_path(@scooter)
  end

  private

  def scooter_params
    params.require(:scooter).permit(:description, :status, :location)
  end
end
