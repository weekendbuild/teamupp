class TeamsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @teams = current_user.teams
    respond_with(@teams)
  end

  def show
    @team = current_user.teams.find(params[:id])
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
