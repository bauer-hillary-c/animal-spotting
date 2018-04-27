class AnimalsController < ApplicationController
  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(name: params[:animals][:name])

    if @animal.save
      PointValue.create(
        animal_id: @animal.id,
        points: params[:animals][:points],
        created_by_id: current_user.id
      )
      # save animal image

      render :new
      # redirect_to @animal, notice: 'Animal was successfully created.'
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :points)
  end
end
