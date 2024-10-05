# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :bigint
#  post_id    :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_comment_id  (comment_id)
#  index_comments_on_post_id     (post_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (comment_id => comments.id)
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :parent, class_name: "Comment", optional: true, foreign_key: :comment_id

  has_many :replies, class_name: "Comment", foreign_key: :comment_id, dependent: :destroy
end
