class StuffsController < ApplicationController
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
    @equipment = Equipment.new(equipment_params)
    @equipment.users_id = current_user.id
    if @equipment.save
      redirect_to equipments_path(@equipments)
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
    @equipment.update(equipment_params)
    redirect_to equipments_path(@equipments)
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :users_id, :categories_id)
  end


end
