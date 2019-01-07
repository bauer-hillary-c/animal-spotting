class ScoresController < ApplicationController
  def update_scores
    @game = Game.find(params[:game_id])
    @players = @game.users

    params[:scores].each do |id, score|
      player = User.find(id)
      player_score = player.scores.find_by(game_id: @game.id)
      new_score = player_score.points + score.to_i

      player_score.update(points: new_score)
    end

    redirect_to game_path(@game.id)
  end
end
