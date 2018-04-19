class PagesController < ApplicationController
  def home
  end

  def score
    @game = Game.find(params[:game_id])
  end

  def update_scores
    @game = Game.find(params[:game_id])

    # update scores

    redirect_to game_path(@game.id)
  end
end
