require 'jsonl'

filename = ENV["SEED_FILE_DIR"]
dirname = File.dirname(filename)
`split -l 20000 #{filename} #{filename}.parts.`
Dir.chdir(dirname)
parts = Dir["#{filename}.parts.*"]
json = ''
parts.each do |partname|
  json += File.read(partname)
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
  puts(to_save)
  Article.create(to_save)
  File.delete(partname)
end



