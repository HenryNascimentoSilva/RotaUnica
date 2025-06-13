class CreateExcursions < ActiveRecord::Migration[8.0]
  def change
    create_table :excursions do |t|
      t.string :name

      t.timestamps
    end
  end
end
