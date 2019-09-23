class CreateJoinTableUsersConverstations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :conversations do |t|
      t.index :user_id
      t.index :conversation_id
    end
  end
end
