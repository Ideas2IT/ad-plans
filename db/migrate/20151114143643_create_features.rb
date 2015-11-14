class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.integer :limit
      t.references :plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
