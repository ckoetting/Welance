class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.date :date
      t.string :infos
      t.references :inquiry, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
