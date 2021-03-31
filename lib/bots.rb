# frozen_string_literal: true

require 'telegram/bot'
require_relative 'motive.rb'
require_relative 'jokes.rb'

# Boot Class all bot fuctionality
class Bot
  attr_reader :token
  def initialize
    @token = '1692524393:AAE9cY7Enn8V09VxwogmJQQCIByl78QJ3fw'
  end

  def start(bot, message)
    bot.api.send_message(
      chat_id: message.chat.id, text: "Hello, #{message.from.first_name} ,
        welcome to motivation chat bot created by Daniel Ufeli,
        the chat bot is to keep you motivated and entertained.
        Use  /start to start the bot,  /stop to end the bot,
        /motivate to get a diffrent motivational quote everytime you request
        for it or /joke to get a joke everytime you request for it"
    )
  end

  def stop(bot, message)
    bot.api.send_message(chat_id: message.chat.id, text: "Bye,
      #{message.from.first_name}", date: message.date)
  end

  def motivation(bot, message)
    values = Motivate.new
    value = values.select_random
    bot.api.send_message(chat_id: message.chat.id,
                         text: (value['text']).to_s, date: message.date)
  end

  def joking(bot, message)
    values = Joke.new
    value = values.make_the_request
    bot.api.send_message(
      chat_id: message.chat.id,
      text:
      "Setup: #{value[0]['setup']}\nPunchline: #{value[0]['punchline']}",
      date: message.date
    )
  end

  def final(bot, message)
    bot.api.send_message(
      chat_id: message.chat.id, text: "Invalid entry,
        #{message.from.first_name}, you need to use  /start,
         /stop , /motivate or /joke"
    )
  end

  def run
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start' then start(bot, message)
        when '/stop' then stop(bot, message)
        when '/motivate' then motivation(bot, message)
        when '/joke' then joking(bot, message)
        else final(bot, message) end
      end
    end
  end
end
