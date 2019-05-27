class BookingsController < ApplicationController
  def create
    # @scooter_status = ['Available', 'Unavailable']
    # @user = User.find(1)
    # @booking = Booking.new(booking_params)

    # if @booking.save
    #   redirect to user_path(@user)
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :status)
  end
end
