# require './customer.rb'
# require './menu.rb'
require 'customer.rb'
require 'menu.rb'

class TakeAway
  attr_reader :take_away_name, :take_away_menu

  def initialize(name)
    @take_away_name = name
    @take_away_menu = Menu.new.menu
  end

  def display_menu
    @take_away_menu.each { |key, val| puts "#{key}....#{val}".center(160) }
  end



end
