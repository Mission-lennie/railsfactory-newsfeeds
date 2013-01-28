class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweetcontent
      t.string :name
      t.string :time

      #t.timestamps
    end
  end
end
