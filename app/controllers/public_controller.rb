class PublicController < ApplicationController

  def index
    @sprint = Sprints.dev
    @sprint_count = @sprint.size
  end

  def graph1
    @sprint = Sprints.dev
    @sprint_count = @sprint.size
  end
  
  def graph2
    @sprint = Sprints.dev
    @sprint_count = @sprint.size
  end
  
  def graph3
    @sprint = Sprints.ui
    @sprint_count = @sprint.size
  end
  
  def graph4
    @sprint = Sprints.ui
    @sprint_count = @sprint.size
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
