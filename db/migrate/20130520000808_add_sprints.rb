class AddSprints < ActiveRecord::Migration
  def up
    create_table :sprints do |t|
            t.string "sprint"
            t.integer "sprint_num"
            t.integer "points"
            t.string "comments"
            t.timestamps
    end
  end

  def down
    drop_table :sprints
  end
end
