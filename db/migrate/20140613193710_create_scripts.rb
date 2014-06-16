class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
<<<<<<< HEAD
    	t.string :text
    	t.integer :lesson_id
    	t.integer :sub_difficulty
    	t.integer :average_cps
    	
=======
      t.string :text
      t.integer :lesson_id
      t.integer :sub_difficulty
      
>>>>>>> 31079e0974f3afa853968e20435eba0d6f787266
      t.timestamps
    end
  end
end
