class CreateBornAmounts < ActiveRecord::Migration[5.0]
  def change
    create_table :born_amounts do |t|
      t.integer :anio 
      t.string :mes
      t.integer :nacimientos

      t.timestamps
    end
  end
end
