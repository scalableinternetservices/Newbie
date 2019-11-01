require 'pp'
require 'sqlite3'


#db = SQLite3::Database.open "articles.db"
rdb = SQLite3::Database.open "articles.sqlite3"

#Connect to the database
#db.execute "CREATE TABLE IF NOT EXISTS ARTICLES(Id INTEGER PRIMARY KEY, KEYWORDS TEXT, ARCHIVE TEXT)"
#db.execute "CREATE TABLE IF NOT EXISTS ARTICLES(TITLE TEXT, KEYWORDS TEXT, ARCHIVE TEXT)"

=begin
update_at = "2019-11-01 07:49:54.617809"

#Fectching
db.execute("select * from ARTICLES") do |row|
  # row[0]: title, row[1]: keywords, row[2]:url
  rdb.execute "INSERT INTO ARTICLES (TITLE, KEYWORDS, URL, CREATED_AT, UPDATED_AT) VALUES (?,?,?,?,?)", [row[0],row[1],row[2],update_at,update_at]
end
=end

rdb.execute("select * from ARTICLES") do |row|
  pp row[1]
  pp row[2]
  # pp row[3]
  pp "____"
end

