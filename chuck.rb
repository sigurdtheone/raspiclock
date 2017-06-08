require 'net/http'
require 'json'

server = "http://api.icndb.com"
teammembers = [['Sigurd','Kristensen']]

random_member = teammembers.sample
firstName = random_member[0]
lastName = random_member[1]

while true do
  uri = URI("#{server}/jokes/random?firstName=#{firstName}&lastName=#{lastName}")
  res = Net::HTTP.get(uri)
  j = JSON[res]
  joke = j['value']['joke']
  File.write('./chuckjoke.data', "#{joke}")
  sleep(300)
end
