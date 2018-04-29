class AnimalsController < ApplicationController
  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(name: params[:animals][:name])

    if @animal.save
      point_value = PointValue.create(
        animal_id: @animal.id,
        points: params[:animals][:points],
        created_by_id: current_user.id
      )

      animal_image = AnimalImage.create(
        image: params[:animals][:image]
      )

      point_value.update(animal_image_id: animal_image.id)

      render :new
      # redirect_to @animal, notice: 'Animal was successfully created.'
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :points, :image)
  end
end
