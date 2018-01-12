class GamesController < ApplicationController
  def new
  end

  def create
    @game = Game.new(game_params)
    Score.create(game: @game, user: params[:user])

    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def index
    @games = Game.all
  end

  private

  def game_params
    params.require(:game).permit(:user)
  end
end
