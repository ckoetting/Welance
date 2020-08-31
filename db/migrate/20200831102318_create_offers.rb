class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.string :skills_required
      t.integer :compensation
      t.boolean :fixed_price
      t.string :location
      t.date :deadline_at
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
