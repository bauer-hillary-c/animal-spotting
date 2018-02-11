class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def new
  end

  def create
    @game = Game.new

    if @game.save
      Score.create(game: @game, user_id: params[:game][:user1_id].to_i, points: 0)
      Score.create(game: @game, user_id: params[:game][:user2_id].to_i, points: 0)
      redirect_to @game
    else
      render 'new'
    end
  end

  def index
    @games = Game.all
  end
end
