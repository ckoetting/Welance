class AddFeatureToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :saved, :boolean, :default => false
  end
end
