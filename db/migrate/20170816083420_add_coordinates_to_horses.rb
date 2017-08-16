class AddCoordinatesToHorses < ActiveRecord::Migration[5.0]
  def change
    add_column :horses, :latitude, :float
    add_column :horses, :longitude, :float
  end
end
