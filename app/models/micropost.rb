class Micropost < ActiveRecord::Base

   validates :content, presence: true, length: {maximum: 140, minimum: 1}
   validates :user_id, presence: true
   belongs_to :user
   # Note: -> means lambda expression (invoked by 'call')
   default_scope -> { order('created_at DESC')}

   def self.from_users_followed_by(user)
      # Since a user has_many followed_users, a method followed_user_ids is
      # automatically created, which returns an array of the ids of those users.
      #     followed_user_ids = user.followed_user_ids
      # Using set inclusion: Doesn't work if the set is huge
      # where(...) automatically interpolates the array with commata
      #     where("user_id IN (?)",followed_user_ids+[user.id])

      # Better: Nested Query (Subselect)
      followed_user_ids = "select followed_id from relationships where follower_id = :user_id"
      # We can write
      #      user_id: user
      # instead of
      #      user_id: user.id
      # because Actve Record uses the id automatically
      where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
         user_id: user)
   end

end
