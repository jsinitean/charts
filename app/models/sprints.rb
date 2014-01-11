class Sprints < ActiveRecord::Base
  # attr_accessible :title, :body
  
 
  #Scoping for sprints  
  scope :dev, where(:dev_ui => 'DEV')
  scope :ui, where(:dev_ui => 'UI')
  scope :range, where("sprint_num = 4")
  scope :team1, where(:team_id => 1)
  scope :team2, where(:team_id => 2)
  
end