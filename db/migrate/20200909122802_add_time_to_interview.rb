class AddTimeToInterview < ActiveRecord::Migration[6.0]
  def change
    add_column :interviews, :time, :time
  end
end
