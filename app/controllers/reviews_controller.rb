class ReviewsController < ApplicationController
  def create
    # @booking = Booking.find(params[:booking_id])
    # @review = Review.new(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
