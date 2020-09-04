class RemoveArColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :skill_list
    remove_column :offers, :location_list
  end
end
