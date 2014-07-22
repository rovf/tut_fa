class User < ActiveRecord::Base

      has_many :microposts, dependent: :destroy
      has_many :relationships, foreign_key: "follower_id", dependent: :destroy
      # The followed users are those in relationships, which have followed_id,
      # but we don't want to access them by user.followeds, but by the more
      # natural user.followed_users
      has_many :followed_users, through: :relationships, source: :followed
      # We need to provide the class_name, because otherwise Rails would assume
      # a class ReverseRelationship
      has_many :reverse_relationships, foreign_key: "followed_id", dependent: :destroy, class_name: "Relationship"
      # We could also omit source, because Rail would by default conclude
      # from :followers, that the source must be :follower
      has_many :followers, through: :reverse_relationships, source: :follower

      validates :name,
                presence: true,
                uniqueness: true,
                format: { with: /\A\w/ },
                length: { maximum: 50 }
      validates :email,
                uniqueness: { case_sensitive: false },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
      before_save { self.email = email.downcase }
      before_create :create_remember_token

      # The following assumes that :users has a column password_digest .
      # It implicitly adds virtual attributes and password_confirmation,
      # and does presence verification for them
      has_secure_password
      validates :password, length: { minimum: 6 }

   def User.new_remember_token
      SecureRandom.urlsafe_base64
   end

   def User.digest_token(token)
      # Don't use bcrypt here. While bcrypt is stronger, it takes more time, and
      # we will need to calculate the digest on every page.
      # We use to_s in case the token is nil.
      Digest::SHA1.hexdigest(token.to_s)
   end

   def feed
      # Feed for this user. Will later contain microposts of followed users too.
      Micropost.where("user_id = ?",id)
   end

   # Is this user following another user?
   def following?(other_user)
      relationships.find_by(followed_id: other_user.id)
   end

   # Establish following
   def follow!(other_user)
      relationships.create!(followed_id: other_user.id)
   end

   # Unestablish following
   def unfollow!(other_user)
      relationships.find_by(followed_id: other_user.id).destroy
   end

private

   def create_remember_token
      self.remember_token = User.digest_token(User.new_remember_token)
   end

end
