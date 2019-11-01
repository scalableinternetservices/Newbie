require 'pp'
require 'sqlite3'


db = SQLite3::Database.open "articles.sqlite3"

#Connect to the database
#db.execute "CREATE TABLE IF NOT EXISTS ARTICLES(Id INTEGER PRIMARY KEY, KEYWORDS TEXT, ARCHIVE TEXT)"
#db.execute "CREATE TABLE IF NOT EXISTS ARTICLES(TITLE TEXT, KEYWORDS TEXT, ARCHIVE TEXT)"

#Fectching
stm = db.prepare "SELECT * FROM ARTICLES LIMIT 5"
rs = stm.execute

begin
rs.each do |row|
  pp row.join "\s"
end

end
