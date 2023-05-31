class StuffsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @stuffs = Stuff.all
  end

  def show
    @stuff = Stuff.find(params[:id])
    @category_name = Category.find(@stuff.category_id).name.to_s
  end

  def edit
    @stuff = Stuff.find(params[:id])
  end

  def update
    @stuff = Stuff.find(params[:id])
    @stuff.update(stuff_params)
    redirect_to stuff_path(@stuff), notice: "L'article a été modifié avec succès"
  end

  def new
    @stuff = Stuff.new
  end

  def create
    @stuff = Stuff.new(stuff_params)
    @stuff.user_id = current_user.id
    if @stuff.save
      redirect_to stuff_path(@stuff)
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
