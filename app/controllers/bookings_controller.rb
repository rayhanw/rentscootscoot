class BookingsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect to user_path(@user)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :status)
  end
end
