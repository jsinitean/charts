class AddBugs < ActiveRecord::Migration
  def up
    add_column("sprints", "bugs", :integer)
  end

  def down
    remove_column("sprints", "bugs", :integer)
  end
end
