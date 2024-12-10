class CreatePalRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :pal_requests do |t|
      t.integer :mentor_id
      t.integer :mentee_id
      t.string :status

      t.timestamps
    end
  end
end
