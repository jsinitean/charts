class Sprints < ActiveRecord::Base
  # attr_accessible :title, :body
    
  scope :dev, where(:dev_ui => 'DEV')
  scope :ui, where(:dev_ui => 'UI')
  
end
