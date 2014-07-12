class Micropost < ActiveRecord::Base

   validates :content, presence: true, length: {maximum: 140, minimum: 1}
   validates :user_id, presence: true
   belongs_to :user
   # Note: -> means lambda expression (invoked by 'call')
   default_scope -> { order('created_at DESC')}

end
