class MilestonesController < ApplicationController
  before_filter :find_milestone
  
  def create
    @milestone = @team.milestones.create!(params[:milestone])
    redirect_to @team
  end
  
  def destroy
    @milestone.destroy
    redirect_to @team
  end
  
  private
  
  def find_milestone
    @team = current_user.teams.find(params[:team_id])
    @milestone = @team.milestones.find(params[:id]) if params[:id]
  end
end