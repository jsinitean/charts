class PublicController < ApplicationController
  require "ruby-standard-deviation"
  
  def index

  end
  
  def graph2
    require 'asana'
 
    Asana.configure do |client|
      client.api_key = 'jlVkWF3.0RBcLBYXbvN5wZeHn0GCEgJN'
    end
  
    @pro1 = Asana::Project.find('19047177713296')
    @tasks1 = @pro1.tasks

  end
  
  def graph3
    require 'asana'
 
    Asana.configure do |client|
      client.api_key = 'jlVkWF3.0RBcLBYXbvN5wZeHn0GCEgJN'
    end
      
    @pro2 = Asana::Project.find('19047177713298')
    @tasks2 = @pro2.tasks

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
      redirect_to(:action => 'index')
    end
  end

end
