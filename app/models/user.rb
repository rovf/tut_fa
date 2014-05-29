class User < ActiveRecord::Base

      has_many :microposts
      validates :name, uniqueness: true, format: { with: /\A\w/ }

end
