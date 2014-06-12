class User < ActiveRecord::Base

      has_many :microposts
      validates :name,
                presence: true,
                uniqueness: true,
                format: { with: /\A\w/ },
                length: { maximum: 50 }
      validates :email,
                uniqueness: { case_sensitive: false },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
      before_save { self.email = email.downcase }

      # The following assumes that :users has a column password_digest .
      # It implicitly adds virtual attributes and password_confirmation,
      # and does presence verification for them
      has_secure_password
      validates :password, length: { minimum: 6 }

end
