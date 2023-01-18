class CreateSignups < ActiveRecord::Migration[7.0]
  def change
    create_table :signups do |t|
      t.references :camper, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.integer :time

      t.timestamps
    end
  end
end
