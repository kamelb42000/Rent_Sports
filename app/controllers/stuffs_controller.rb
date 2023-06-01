class StuffsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @stuffs = Stuff.geocoded
    @markers = @stuffs.map do |stuff|
      {
        lat: stuff.latitude,
        lng: stuff.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {stuff: stuff}),
        marker_html: render_to_string(partial: "marker", locals: {stuff: stuff})
      }
    end
  end

  def show
    @stuff = Stuff.find(params[:id])
    @category_name = Category.find(@stuff.category_id).name.to_s
    @booking = Booking.new
  end

  def edit
    @stuff = Stuff.find(params[:id])
  end

  def update
    @stuff = Stuff.find(params[:id])
    if @stuff.update(stuff_params)
    redirect_to stuffs_path(@stuffs), notice: "L'équipement a été modifié avec succès"
    else
      render :edit
    end
  end

  def new
    @stuff = Stuff.new
  end

  def create
    @stuff = Stuff.new(stuff_params)
    @stuff.user_id = current_user.id
    if @stuff.save
      return redirect_to stuffs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @stuff = Stuff.find(params[:id])
    @stuff.destroy
    redirect_to stuffs_path, status: :see_other
  end

  private

  def stuff_params
    params.require(:stuff).permit(:name, :price, :category_id)
  end

end
