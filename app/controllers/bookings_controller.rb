class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index, :edit, :update]

  def index
    @user = current_user
    @bookings = Booking.where(user: @user)
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    @review = Review.new
    authorize @review
  end

  def create
    @user = current_user
    @scooter = Scooter.find(params[:scooter_id])
    @booking = Booking.new(booking_params)
    authorize @booking

    @booking.user = @user
    @booking.scooter = @scooter
    if @booking.save
      # raise
      redirect_to bookings_path
    else
      render 'scooters/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    # raise
    if @booking.destroy
      redirect_to bookings_path
    else
      render :index
    end
  end

  def edit
    @user = current_user
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)

    flash[:notice] = 'Booking successfully updated'
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
