require "rubygems"
require "twitter"
require 'pp'
require "mysql"
# require activerecord ,
# http://stackoverflow.com/questions/11111733/how-to-use-active-record-without-rails
# MY ACCESS KEY IS USED


@conn = Mysql.real_connect("localhost","root","root","newsfeeds_development")
@conn.query("SET NAMES utf8")
@conn.autocommit(false)


Twitter.configure do |config|
  config.consumer_key = "d3ZZSo0fu2MdxqBqRiakww"
  config.consumer_secret = "p9srcywDKAeJcBTQDBAgjYseD7cOvNFNmuPD3TIn4"
  config.oauth_token = "990318920-eYwbXtyO1uCmv1kHEDB2EK1Mor3cR4OT1LbmCyar"
  config.oauth_token_secret = "VBBU6BfLJiZVrerIUdLEHjj7OL9RVJttOHVAY1rG8"
end

@tweetcontent = []
@name = []
@time = []
#@client = Twitter::Client.new()
a=Twitter.home_timeline
unless a.empty?
a.each do |record|
 @tweetcontent <<record.text
 @name << record.user.name
 @time << record.user.created_at
end
end



	for j in 0..(a.count)
    p "22222222222222222222222222222222222222222222"
    p @tweetcontent[j]
    p @name[j]
    p @time[j]
    p "22222222222222222222222222222222222222222222"
	  	@insert_shares = @conn.prepare(format("INSERT INTO tweets (tweetcontent, name,time) VALUES (?, ?, ?)"))
      @insert_shares.execute(@tweetcontent[j], @name[j], @time[j]) rescue "NULL"
      @conn.commit()
		p 'Saved'
	end
#~ pp Twitter.mentions_timeline



#pp Twitter.update("I am a bot") # needs a oauth key with write permissions
