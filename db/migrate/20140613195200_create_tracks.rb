class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
    	t.integer :user_id
    	t.integer :lesson_id

      t.timestamps
    end
  end
end
