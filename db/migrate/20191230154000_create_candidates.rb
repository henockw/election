class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps
    end
    add_index :candidates, :user_id
  end
end
