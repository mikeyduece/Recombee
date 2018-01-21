class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.string :user_id
      t.string :movie_id
      t.string :rating

      t.timestamps
    end
  end
end
