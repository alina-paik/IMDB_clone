class AddToRatingsTable < ActiveRecord::Migration[5.2]
  def change
    add_index :ratings, [:user_id, :movie_id], unique: true
  end
end
