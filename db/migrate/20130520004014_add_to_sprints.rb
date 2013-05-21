class AddToSprints < ActiveRecord::Migration
  def up
    add_column("sprints", "dev_ui", :string, :limit => 255)
    add_column("sprints", "hours", :integer)
    add_column("sprints", "prioritized_pts", :integer)
    add_column("sprints", "prioritized_stor", :integer)
    add_column("sprints", "completed_stor", :integer)
    rename_column("sprints", "points", "completed_pts")
  end

  def down
    remove_column("sprints", "dev_ui", :string, :limit => 255)
    remove_column("sprints", "hours", :integer)
    remove_column("sprints", "prioritized_pts", :integer)
    remove_column("sprints", "prioritized_stor", :integer)
    remove_column("sprints", "completed_stor", :integer)
  end
end
