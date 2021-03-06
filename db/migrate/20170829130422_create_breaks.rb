class CreateBreaks < ActiveRecord::Migration[5.1]
  def change
    create_table :breaks do |t|
      t.references :expense, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
