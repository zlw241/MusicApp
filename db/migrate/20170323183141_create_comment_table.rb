class CreateCommentTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :parent_id, default: nil
      t.string :heading
      t.string :body, null: false

      t.timestamps
    end
  end
end
