class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
    	t.integer :number_missed
    	t.integer :total_characters
    	t.time :time_elapsed
    	t.float :wpm
      t.string :missed_characters
    	t.integer :script_id
    	t.integer :user_id

      t.timestamps
    end
  end
end
