require_relative './menu.rb'
require_relative './cuisine.rb'

class Server

  attr_reader :menu

  def initialize(menu_klass, cuisine_klass)
    @menu_klass = menu_klass
    @cuisine_klass = cuisine_klass
  end

  def request_cuisine
    puts "What cuisine would you like?"
    cuisine = gets.chomp
    @cuisine = @cuisine_klass.new(cuisine)
  end

  def create_menu
    @menu = @menu_klass.new
  end

  def present_menu

  end
end
