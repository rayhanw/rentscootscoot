class ScootersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @scooters = params[:search] ? Scooter.where('lower(name) LIKE ?', "%#{params[:search].downcase}%") : Scooter.all
  end

  def show
    @scooter = Scooter.find(params[:id])
  end

  def new
    @scooter = Scooter.new
  end

  def create
    @user = current_user
    @scooter = Scooter.new(scooter_params)
    @scooter.user = @user
    if @scooter.save
      redirect_to scooter_path(@scooter)
    else
      render :new
    end
  end

  private

  def scooter_params
    params.require(:scooter).permit(:description, :status, :location, :photo, :name)
  end
end
