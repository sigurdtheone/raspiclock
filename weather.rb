require 'net/http'
require 'json'

server = "https://api.forecast.io"
api_key = "API_KEY"
lat = "55.6477483"
long = "12.5309684"
uri = URI("#{server}/forecast/#{api_key}/#{lat},#{long}")

while true do
  forecast = Net::HTTP.get(uri)
  forecast = JSON[forecast]
  summary = forecast['hourly']['summary']
  File.write('./summary.data', "#{summary}")
  sleep(300)
end
