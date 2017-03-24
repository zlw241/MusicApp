# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  parent_id  :integer
#  heading    :string
#  body       :string           not null
#  created_at :datetime
#  updated_at :datetime
#



class Comment < ActiveRecord::Base

  validates :user_id, :body, presence: true


  belongs_to :parent,
    class_name: "Comment",
    foreign_key: :parent_id,
    primary_key: :id

  has_one :child,
    class_name: "Comment",
    foreign_key: :parent_id,
    primary_key: :id

  belongs_to :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  has_many :comment_likes,
    class_name: "CommentLike",
    foreign_key: :comment_id,
    primary_key: :id

  has_many :likes,
    through: :comment_likes,
    source: :user


end
