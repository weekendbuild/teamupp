class TasksController < ApplicationController
  before_filter :find_task
  
  def create
    @task = @milestone.tasks.create!(params[:task])
    redirect_to @team
  end
  
  def update
    @task.complete!(current_user)
    redirect_to @team
  end
  
  def destroy
    @task.destroy
    redirect_to @team
  end
  
  
  private
  def find_task
    @team = current_user.teams.find(params[:team_id])
    @milestone = @team.milestones.find(params[:milestone_id])
    @task = @milestone.tasks.find(params[:id]) if params[:id]
  end
end