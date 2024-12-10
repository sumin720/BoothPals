class AddLocationAndProgramTypeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :location, :string
    add_column :users, :program_type, :string
  end
end
