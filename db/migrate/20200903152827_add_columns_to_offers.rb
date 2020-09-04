class AddColumnsToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :location_list, :string
    add_column :offers, :skill_list, :string
  end
end
