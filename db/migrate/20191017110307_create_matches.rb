class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.references :user, foreign_key: true
      t.integer :matched_with_user_id, foreign_key: true
      t.index :matched_with_user_id
      t.timestamps
    end
  end
end
