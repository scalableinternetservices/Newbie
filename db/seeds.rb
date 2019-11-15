require 'jsonl'

dirname = File.join(File.dirname(__FILE__), 'seed')
`split -l 20000 #{filename} #{filename}.parts.`
Dir.chdir(dirname)
parts = Dir["#{filename}.parts.*"]


parts = Dir.entries(dirname).select {|f| !File.directory? f}
json = ''
parts.each do |partname|
  json = File.read(File.join(dirname, partname))
  records = JSONL.parse(json)
  to_save = []
  records.each do |record|
    x = {}
    x["title"] = record["title"]
    x["body"] = record["text"]
    x["date_published"] = record["date"]
    x["summary"] = record["summary"]
    x["url"] = record["url"]
    to_save.append(x)
  end
  Article.create(to_save)
  File.delete(partname)
end



