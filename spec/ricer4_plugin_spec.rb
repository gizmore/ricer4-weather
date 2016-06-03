require 'spec_helper'

describe Ricer4::Plugins::Weather do
  
  # LOAD
  bot = Ricer4::Bot.new("ricer4.spec.conf.yml")
  bot.db_connect
  ActiveRecord::Magic::Update.install
  ActiveRecord::Magic::Update.run
  bot.load_plugins
  ActiveRecord::Magic::Update.run

  it("can fetch weather data") do
    expect(bot.exec_line("weather 31224")).to start_with("The temperature")
  end
  
end
