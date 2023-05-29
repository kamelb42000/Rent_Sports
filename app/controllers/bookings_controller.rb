class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # @booking.list = @equipement
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @booking = Booking.find(params[id])
  end


  def booking_params
    params.require(:booking).permit(:equipement_id, :user_id)
  end


end
