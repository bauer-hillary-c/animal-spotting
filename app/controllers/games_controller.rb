class GamesController < ApplicationController
  def new
  end

  def create
    @game = Game.new
    Score.create(game: @game, user_id: params[:user1_id])
    Score.create(game: @game, user_id: params[:user2_id])

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
