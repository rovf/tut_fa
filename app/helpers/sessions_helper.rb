module SessionsHelper

   def sign_in(user)
      remember_token=User.new_remember_token
      # Set as a cookie, not just in the session, because we want to automatically login
      cookies[:remember_token]={ value: remember_token, expires: 20.years.from_now.utc }
      # We could also say:
      #    cookies.permanent[:remember_token]=remember_token
      user.update_attribute(:remember_token,User.digest_token(remember_token))
      self.current_user=user
   end

   def current_user=(u)
      @current_user=u
   end

   def current_user
      @current_user||=User.find_by(remember_token: User.digest_token(cookies[:remember_token]))
   end

   def signed_in?
      !current_user.nil?
   end

   def sign_out
      current_user.update_attribute(:remember_token, User.digest_token(User.new_remember_token))
      cookies.delete(:remember_token)
      self.current_user=nil
   end
end
