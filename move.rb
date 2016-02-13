require 'trello'
require 'dotenv'
require 'pp'

include Trello
include Trello::Authorization

Dotenv.load()

#認証用の共通ロジック開始

Trello.configure do |config|
  config.consumer_key = ENV['TRELLO_CONSUMER_KEY']
  config.consumer_secret = ENV['TRELLO_CONSUMER_SECRET']
  config.oauth_token = ENV['TRELLO_OAUTH_TOKEN']
end

me = Trello::Member.find("me")

# me.boards.each do |board|
#  puts board.id
#  puts board.name
# end


# check the board & list id
holiday = ENV['HOLIDAY_BOARD_ID']
todo = ENV['TODO_LIST_ID']
doing = ENV['DOING_LIST_ID']
done = ENV['DONE_LIST_ID']


Board.find(holiday).lists.each do |list|
	
	list.cards.each do |card|
		card.move_to_list(todo)
	end
end
