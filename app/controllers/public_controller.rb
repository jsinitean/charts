class PublicController < ApplicationController
  require "ruby-standard-deviation"
  
  def index
    @sprint = Sprints.dev
    @sprint_count = @sprint.size
  end
  
  def graph2
    @sprint = Sprints.dev
    @sprint_count = @sprint.average(:completed_pts)
    @sprint_count_round = @sprint_count.round(1)
    @sprint_hours = @sprint.average(:hours)
    @sprint_hours_round = @sprint_hours.round(1)
    @sprint_bugs = @sprint.average(:bugs)
    @sprint_bugs_round = @sprint_bugs.round(1)
  end
  
  def graph3
    @sprint = Sprints.ui
    @sprint_count = @sprint.average(:completed_pts)
    @sprint_count_round = @sprint_count.round(1)
    @sprint_hours = @sprint.average(:hours)
    @sprint_hours_round = @sprint_hours.round(1)
    @sprint_bugs = @sprint.average(:bugs)
    @sprint_bugs_round = @sprint_bugs.round(1)
  end
  
  def create
    # Instantiate a new object using form parameters
    @sprint = Sprints.new(params[:sprint])
    # Save the object
    if @sprint.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Sprint Saved."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      redirect_to(:action => 'graph1')
    end
  end

end
