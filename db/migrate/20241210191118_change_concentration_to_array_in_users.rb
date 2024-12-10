class ChangeConcentrationToArrayInUsers < ActiveRecord::Migration[7.1]
  def change
    # Remove the old column if it was present.
    # If you never had `concentration` before, you can omit this line.
    remove_column :users, :concentration, :string, if_exists: true

    # Add the new array column for concentrations
    add_column :users, :concentrations, :text, array: true, default: []
  end
end

