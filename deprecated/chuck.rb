#!/usr/bin/ruby

require 'net/http'
require 'json'

server = "http://api.icndb.com"
teammembers = [['Sigurd','Kristensen']]

random_member = teammembers.sample
firstName = random_member[0]
lastName = random_member[1]

while true do
  uri = URI("#{server}/jokes/random?firstName=#{firstName}&lastName=#{lastName}")
  
  begin
    res = Net::HTTP.get_response(uri)

    # Check if the response is successful
    if res.is_a?(Net::HTTPSuccess)
      j = JSON.parse(res.body)
      joke = j['value']['joke']
      File.write('./chuckjoke.data', "#{joke}")
    else
      puts "Error: Received #{res.code} response from the server"
      puts res.body  # Log the response body for debugging
    end
  rescue JSON::ParserError => e
    puts "JSON parse error: #{e.message}"
    puts "Response body: #{res.body}" if res
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  end

  sleep(300)
end
