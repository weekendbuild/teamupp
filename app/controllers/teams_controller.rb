class TeamsController < ApplicationController

  def index
    @teams = current_user.teams
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create!(params[:team])
    @team.users << current_user
    redirect_to @team
  end

end
