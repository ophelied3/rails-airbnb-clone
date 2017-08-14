class CreateHorses < ActiveRecord::Migration[5.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.text :address
      t.text :description
      t.string :title
      t.date :birth_date
      t.string :sexe
      t.string :race
      t.string :disciplines
      t.string :character
      t.integer :required_level
      t.integer :monthly_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
