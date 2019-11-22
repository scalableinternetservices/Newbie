require 'jsonl'

# dirname = File.join(File.dirname(__FILE__), 'seed')
# parts = Dir.entries(dirname).select {|f| !File.directory? f}
# json = ''
# parts.each do |partname|
#   json = File.read(File.join(dirname, partname))
#   records = JSONL.parse(json)
#   to_save = []
#   records.each do |record|
#     x = {}
#     x["title"] = record["title"]
#     x["body"] = record["text"]
#     x["date_published"] = record["date"]
#     x["summary"] = record["summary"]
#     x["url"] = record["url"]
#     to_save.append(x)
#   end
#   Article.create(to_save)
# end

# For user relationship test only
# Users
User.create!(user_name: "First User",
             email: "test@gmail.com",
             password: "helloworld",
             password_confirmation: "helloworld")

99.times do |n|
  name = Faker::Name.name
  email = "test-#{n+1}@gmail.com"
  password = "password"
  User.create!(user_name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

# Create following relationships.
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
