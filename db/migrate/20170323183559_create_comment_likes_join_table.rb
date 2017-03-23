class CreateCommentLikesJoinTable < ActiveRecord::Migration
  def change

    create_table :comment_likes do |t|
      t.integer :user_id, null: false
      t.integer :comment_id, null: false

      t.timestamps 
    end
  end
end
