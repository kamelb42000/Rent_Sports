class EquipmentsController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[id])
  end

  def edit
    @equipment = Equipment.find(params[id])
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipement_params)
    if @equipment.save
      redirect_to equipment_path(@equipments)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy
    redirect_to equipments_path(@equipments), status: :see_other
  end

  def update
    @equipment = Equipment.find(params[id])
    @equipment.update(restaurant_params)
    redirect_to equipments_path(@equipments)
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :year, :price)
  end


end
