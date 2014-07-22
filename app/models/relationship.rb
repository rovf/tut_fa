class Relationship < ActiveRecord::Base
   # The foreign key follower_id points into the :user model
   # (without supplying a class_name, it would point to a Follower model)
   belongs_to :follower, class_name: "User"
   belongs_to :followed, class_name: "User"
   validates :follower_id, presence: true
   validates :followed_id, presence: true
end
