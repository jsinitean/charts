class AddTeams < ActiveRecord::Migration
  def up
    add_column("sprints", "team_id", :integer)
  end

  def down
    remove_column("sprints", "team_id", :integer)
  end
end
