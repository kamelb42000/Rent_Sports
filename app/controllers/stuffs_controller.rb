class StuffsController < ApplicationController
  def index
    @stuffs = Stuff.all
  end

  def show
    @stuff = Stuff.find(params[:id])
  end

  def edit
    @stuff = Stuff.find(params[:id])
  end

  def new
    @stuff = Stuff.new
  end

  def create
    @stuff = Stuff.new(stuff_params)
    @stuff.user_id = current_user.id
    if @stuff.save
      redirect_to stuffs_path(@stuffs)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @stuff = Stuff.find(params[:id])
    @stuff.destroy
    redirect_to stuffs_path(@stuffs), status: :see_other
  end

  def update
    @stuff = Stuff.find(params[id])
    @stuff.update(stuff_params)
    redirect_to stuffs_path(@stuffs)
  end

  private

  def stuff_params
    params.require(:stuff).permit(:name, :user_id, :category_id)
  end


end
