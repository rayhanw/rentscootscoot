class ScootersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :user, only: [:index, :show, :new, :create]

  def index
    #@scooters = params[:search] ? Scooter.where('lower(name) LIKE ?', "%#{params[:search].downcase}%") : Scooter.all
    @scooters = policy_scope(Scooter)
  end

  def show
    @scooter = Scooter.find(params[:id])
    authorize @scooter
    @reviews = @scooter.reviews
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @scooter = Scooter.new
    authorize @scooter
  end

  def create
    @scooter = Scooter.new(scooter_params)
    authorize @scooter
    @scooter.user = @user
    if @scooter.save
      redirect_to scooter_path(@scooter)
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @scooter = Scooter.find(params[:id])
    authorize @scooter
    if @scooter.destroy
      redirect_to scooters_path
    else
      render :index
    end
  end


  private

  def user
    @user = current_user
  end

  def scooter_params
    params.require(:scooter).permit(:description, :price, :status, :location, :photo, :name)
  end
end
