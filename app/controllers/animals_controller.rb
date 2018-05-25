class AnimalsController < ApplicationController
  def show
    @animal = Animal.find(params[:id])
    @point_value = @animal.
      point_values.
      where(created_by_id: current_user.id).
      last
  end

  def index
    animal_ids = current_user.point_values.pluck(:animal_id)
    @animals = Animal.
    where(id: animal_ids).
    order("created_at DESC")
  end

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

      redirect_to animals_url, notice: 'Animal was successfully created.'
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :points, :image)
  end
end
