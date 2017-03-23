# == Schema Information
#
# Table name: comment_likes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  comment_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#



class CommentLike < ActiveRecord::Base

  validates :user_id, :comment_id, presence: true
  
  belongs_to :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :comment,
    class_name: "Comment",
    foreign_key: :comment_id,
    primary_key: :id

end
