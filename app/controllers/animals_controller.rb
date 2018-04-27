class AnimalsController < ApplicationController
  def new
    @animal = Animal.new
  end

  def create
    @animal = current_user.animals.build(animal_params)

    if @animal.save
      redirect_to @animal, notice: 'Animal was successfully created.'
    else
      render :new
    end
  end
end
