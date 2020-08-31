class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.string :status
      t.string :message
      t.references :offer, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
