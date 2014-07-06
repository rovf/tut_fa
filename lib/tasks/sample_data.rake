namespace :db do
   desc "Fill database with sample user data"
   task populate: :environment do
      User.create!(name: "Initial Example User",
                   email: "ieu@railstutorial.org",
                   password: "foobar",
                   password_confirmation: "foobar")
      99.times do |n|
         User.create!(name: Faker::Name.name,
                      email: "example-#{n+1}@railstutorial.org",
                      password: "password",
                      password_confirmation: "password")
      end
   end
end