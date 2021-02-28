class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.integer :base
      t.integer :top
      t.string :date

      t.timestamps
    end
  end
end
