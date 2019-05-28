class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
  end

  def create

    @user = current_user
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.booking.user = @user

    if @review.save
      redirect_to scooter_path(@review.booking.scooter)
    else
      redirect_to @booking
      flash[:alert] = "The Review was not saved"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
