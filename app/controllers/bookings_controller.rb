class BookingsController < ApplicationController

  def index
  @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @stuff = Stuff.find(params[:stuff_id])

    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.stuff_id = @stuff.id
    @booking.accepted = true

    if !@stuff.bookings.where(date: @booking.date).empty?
      return redirect_to stuff_path(@stuff), flash: {alert: "Cet équipement est déjà réservé à cette date."}
    end

    if @booking.save
      return redirect_to bookings_path
    else
      redirect_to stuff_path(@stuff), flash: {alert: @booking.errors}
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
    redirect_to bookings_path(@bookings), notice: "La réservation a été modifiée avec succès"
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

private

  def booking_params
    params.require(:booking).permit(:date, :user_id, :stuff_id)
  end
end
