class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :candidate_id
      t.timestamps
    end
    add_index :enrollments, [:user_id, :candidate_id]
    add_index :enrollments, :candidate_id
  end
end
