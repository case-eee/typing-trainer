class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
    	t.string :text
    	t.integer :lesson_id
    	t.integer :sub_difficulty
    	t.integer :average_cps

      t.timestamps
    end
  end
end
