class AddFolowers < ActiveRecord::Migration[7.2]
  def change
    create_table :followers do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :follower, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
