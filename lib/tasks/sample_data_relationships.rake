namespace :db do
   desc "Fill database with followers"
   task populate_rel: :environment do
      users = User.all
      [0,30,60].each do |i|
         user=users[i]
         followed_users = users[(i+1)..(i+28)]
         followers = users[(i+2)..(i+18)]
         followed_users.each { |followed| user.follow!(followed) }
         followers.each { |follower| follower.follow!(user) }
      end
   end
end