class GamesController < ApplicationController
  def new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def index
    @games = Game.all
  end
end
