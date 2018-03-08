class PagesController < ApplicationController
  def home
  end

  def score
    @game = Game.find(params[:game_id])
  end

  def update_scores
    @game = Game.find(params[:game_id])

    p1_score = @game.users.first.scores.find_by(game_id: @game.id)
    new_player_1_score = (player_1_score =+ params[:scores][:player_1_points].to_i)
    p1_score.update(points: new_player_1_score)

    p2_score = @game.users.last.scores.find_by(game_id: @game.id)
    new_player_2_score = (player_2_score =+ params[:scores][:player_2_points].to_i)
    p2_score.update(points: new_player_2_score)

    redirect_to game_path(@game.id)
  end
end
