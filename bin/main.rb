#!/usr/bin/env ruby

require_relative '../lib/bots.rb'
require_relative '../lib/motive.rb'

puts 'Hello! , Welcome to our motivational and Jokes telegram bot'
puts 'Bot Loaded enjoy... use ctrl-c to stop the bot'

start_bot = Bot.new
start_bot.run
