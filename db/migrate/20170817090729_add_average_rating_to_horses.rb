class AddAverageRatingToHorses < ActiveRecord::Migration[5.0]
  def change
    add_column :horses, :average_rating, :float
  end
end
