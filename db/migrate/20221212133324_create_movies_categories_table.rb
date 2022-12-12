class CreateMoviesCategoriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :movies_categories do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
