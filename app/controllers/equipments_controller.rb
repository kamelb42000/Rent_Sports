class EquipmentsController < ApplicationController
  def index
    @equipements = Equipment.all
  end

  def show
    @equipement = Equipment.find(params[id])
  end

  def edit
    @equipement = Equipment.find(params[id])
  end

  def new
    @equipement = Equipment.new
  end

  def create
    @equipment = Equipement.new(equipement_params)
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
    @equipement = Equipment.find(params[id])
    @equipement.update(restaurant_params)
    redirect_to equipments_path(@equipements)
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :year, :price)
  end


end
