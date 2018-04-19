class GamesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @game = Game.find(params[:id])
    @players = @game.users
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
    @games = Game.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end
end
