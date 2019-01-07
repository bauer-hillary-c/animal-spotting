class ScoresController < ApplicationController
  def update_scores
    @game = Game.find(params[:game_id])
    @players = @game.users

    if params[:scores][:player_1_points].present?
      p1_score = @players.first.scores.find_by(game_id: @game.id)
      new_player_1_score = (p1_score.points + params[:scores][:player_1_points].to_i)
      p1_score.update(points: new_player_1_score)
    end

    if params[:scores][:player_2_points].present?
      p2_score = @players.last.scores.find_by(game_id: @game.id)
      new_player_2_score = (p2_score.points + params[:scores][:player_2_points].to_i)
      p2_score.update(points: new_player_2_score)
    end

    redirect_to game_path(@game.id)
  end
end
