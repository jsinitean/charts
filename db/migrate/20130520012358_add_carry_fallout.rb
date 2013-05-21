class AddCarryFallout < ActiveRecord::Migration
  def up
    add_column("sprints", "fallout_pts", :integer)
    add_column("sprints", "fallout_stor", :integer)
    add_column("sprints", "carryover_pts", :integer)
    add_column("sprints", "carryover_stor", :integer)
  end

  def down
    remove_column("sprints", "fallout_pts", :integer)
    remove_column("sprints", "fallout_stor", :integer)
    remove_column("sprints", "carryover_pts", :integer)
    remove_column("sprints", "carryover_stor", :integer)
  end
end
