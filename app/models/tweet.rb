require "rubygems"
require "twitter"
require 'pp'
require "mysql"
#require activerecord 

class Tweet < ActiveRecord::Base
  attr_accessible :name, :time, :tweetcontent
  
  
  def self.storetweet
    @conn = Mysql.real_connect("localhost","root","root","newsfeeds_development")
    @conn.query("SET NAMES utf8")
    @conn.autocommit(false)


  Twitter.configure do |config|
    config.consumer_key = "ApktrzPEImrqJ3JC58Oug"
    config.consumer_secret = "NWeI3XbK3U4QVCLJ8KojEyfHMizSW50dOBAFeH6lw"
    config.oauth_token = "1127523145-edJKIwAJ4HzqQ7yd4W3Het4wftjVopH4LKfvJoy"
    config.oauth_token_secret = "qOJoc7iLd2wk19wVbpB4X6Hh7BFrAS2sIKu8AjUxcYo"
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
  end
end
