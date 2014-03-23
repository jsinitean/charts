class PublicController < ApplicationController
  require "ruby-standard-deviation"
  
  def index
    require 'asana'
 
    Asana.configure do |client|
      client.api_key = 'jlVkWF3.0RBcLBYXbvN5wZeHn0GCEgJN'
    end
      
    #@users = Asana::User.me
    #@tags = Asana::Tag.find('9393480861390')
    #@tasks = @tags.tasks
    @pro1 = Asana::Project.find('9491387612778')
    @pro2 = Asana::Project.find('9491387612780')
    @pro3 = Asana::Project.find('9491387612782')
    @tasks1 = @pro1.tasks
    @tasks2 = @pro2.tasks
    @tasks3 = @pro3.tasks
    
    #require "rubygems"
    #require "JSON"
    #require "net/https"
    #require "uri"
    #api_key = "jlVkWF3.0RBcLBYXbvN5wZeHn0GCEgJN"
    #workspace_id = "137577850971"

    # set up HTTPS connection
    #uri = URI.parse("https://app.asana.com/api/1.0/tags/9191758976196/tasks?opt_fields=name,completed,assignee")
    #http = Net::HTTP.new(uri.host, uri.port)
    #http.use_ssl = true
    #http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # set up the request
    #header = {
    #  "Content-Type" => "application/json"
    #}
    
    #fullPath = uri.path+'?'+uri.query
    
    #req = Net::HTTP::Get.new(fullPath)
    #req.basic_auth(api_key, '')
    #res = http.start { |http| http.request(req) }
    #@object = res.body
    # output
    #print http.request(req)

    #objectResult = JSON.parse(res.body)
    #objectPretty = JSON.pretty_generate(objectResult)
    #@object = objectPretty  
    
    @sprint1 = Sprints.ui.range
    @sprint_count1 = @sprint1.average(:completed_pts)
    @sprint_count_round1 = @sprint_count1.round(1)
    @sprint_hours1 = @sprint1.average(:hours)
    @sprint_hours_round1 = @sprint_hours1.round(1)

    @sprint2 = Sprints.dev.range.team2
    @sprint_count2 = @sprint2.average(:completed_pts)
    @sprint_count_round2 = @sprint_count2.round(1)
    @sprint_hours2 = @sprint2.average(:hours)
    @sprint_hours_round2 = @sprint_hours2.round(1)
    
    @sprint3 = Sprints.dev.range.team1
    @sprint_count3 = @sprint3.average(:completed_pts)
    @sprint_count_round3 = @sprint_count3.round(1)
    @sprint_hours3 = @sprint3.average(:hours)
    @sprint_hours_round3 = @sprint_hours3.round(1)
    
  end
  
  def graph2
    require 'asana'
 
    Asana.configure do |client|
      client.api_key = 'jlVkWF3.0RBcLBYXbvN5wZeHn0GCEgJN'
    end
  
    @pro2 = Asana::Project.find('11087568571419')
    
    @sprint = Sprints.dev
    @sprint_count = @sprint.average(:completed_pts)
    @sprint_count_round = @sprint_count.round(1)
    @sprint_hours = @sprint.average(:hours)
    @sprint_hours_round = @sprint_hours.round(1)
    @sprint_bugs = @sprint.average(:bugs)
    @sprint_bugs_round = @sprint_bugs.round(1)
  end
  
  def graph3
    require 'asana'
 
    Asana.configure do |client|
      client.api_key = 'jlVkWF3.0RBcLBYXbvN5wZeHn0GCEgJN'
    end
      
    @pro1 = Asana::Project.find('11087568571417')
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
      redirect_to(:action => 'index')
    end
  end

end
