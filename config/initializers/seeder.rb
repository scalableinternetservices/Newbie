if not ActiveRecord::Base.connection.table_exists? 'articles'
  `bundle exec rails db:migrate`
end
if Article.count == 0
  puts("Starting seeding database")
  seeding_process = `nohup bundle exec rails db:seed >/dev/null 2>&1 &`
end
