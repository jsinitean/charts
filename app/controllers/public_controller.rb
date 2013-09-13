class PublicController < ApplicationController
  require "ruby-standard-deviation"
  
  #!/usr/bin/env ruby

  #require "rubygems"
  #require "JSON"
  #require "net/https"
  #require "uri"
  #api_key = "jlVkWF3.0RBcLBYXbvN5wZeHn0GCEgJN"
  #workspace_id = "7289715607517"

  # set up HTTPS connection
  #uri = URI.parse("https://app.asana.com/api/1.0/projects/7289715607517/tasks?opt_fields=name")
  #http = Net::HTTP.new(uri.host, uri.port)
  #http.use_ssl = true
  #http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  # set up the request
  #header = {
  #  "Content-Type" => "application/json"
  #}

  #request = Net::HTTP::Get.new(uri.request_uri)
  #response = http.request(request)
  #response.body = {
  #  "data" => {
  #    "workspace" => workspace_id,
  #    "name" => "Hello World!",
  #    "assignee" => assignee
  #  }
  #}.to_json()
  
  #response.status
  
  #body = JSON.parse(res.body)
  #if body['errors'] then
  #  puts "Server returned an error: #{body['errors'][0]['message']}"
  #else
  #  puts "Created task with id: #{body['data']['id']}"
  #end
  
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
