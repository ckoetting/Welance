class AddEmploymentTypeToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :employment_type, :string
  end
end
