namespace :db do
   desc "Generate microposts for the first few users"
   task populate_mp: :environment do
      users = User.all.limit(6)
      50.times do
         content = Faker::Lorem.sentence(5)
         users.each { |u| u.microposts.create!(content: content) }
      end
   end
end