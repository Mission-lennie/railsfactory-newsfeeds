require "rubygems"
require "twitter"
require 'pp'
# require activerecord ,
# http://stackoverflow.com/questions/11111733/how-to-use-active-record-without-rails
# MY ACCESS KEY IS USED

Twitter.configure do |config|
  config.consumer_key = "d3ZZSo0fu2MdxqBqRiakww"
  config.consumer_secret = "p9srcywDKAeJcBTQDBAgjYseD7cOvNFNmuPD3TIn4"
  config.oauth_token = "990318920-eYwbXtyO1uCmv1kHEDB2EK1Mor3cR4OT1LbmCyar"
  config.oauth_token_secret = "VBBU6BfLJiZVrerIUdLEHjj7OL9RVJttOHVAY1rG8"
end


#@client = Twitter::Client.new()
a=Twitter.home_timeline
unless a.empty?
a.each do |record|
p record.text
p 888888888888888888888888
end
end
#~ pp Twitter.mentions_timeline



#pp Twitter.update("I am a bot") # needs a oauth key with write permissions
