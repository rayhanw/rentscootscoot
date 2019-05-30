class ScootersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :user, only: [:index, :show, :new, :create]

  def index
    @scooters = policy_scope(Scooter)
    if params[:search].present?
      @scooters = Scooter.where('lower(name) LIKE ?', "%#{params[:search].downcase}%")
    else
      @scooters = Scooter.all
    end

    @markers = @scooters.map do |scooter|
      {
        lat: scooter.latitude,
        lng: scooter.longitude
      }
    end
  end

  def show
    @scooter = Scooter.find(params[:id])
    authorize @scooter
    @markers = {
      lat: @scooter.latitude,
      lng: @scooter.longitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { scooter: @scooter }),
      image_url: helpers.asset_url('banner-bg.jpg')
    }

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
    @scooter.user = @user
    authorize @scooter
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
