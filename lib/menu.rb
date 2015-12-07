require 'yaml'
require 'twilio-ruby'
require_relative 'twilio.rb'

class Menu

attr_reader :menu
attr_accessor :basket

  def initialize(file)
    @menu = YAML.load_file(file)
    @basket = []
  end

  def view_menu
    @menu
  end


  def choose(item_name, quantity)
    if quantity == 0
        remove_item(item_name)
    else
      remove_item(item_name) if already_in_basket?(item_name)
      quantity.times do
        @basket << @menu.select{|item| item_name === item}
        @basket - [{}]
       end
    end
  end


  def total
    sum = @basket.map{|hash| hash.values}.flatten
    sum.inject(:+)
  end

  def complete_order
    send_message
    empty_basket
  end


private

  def remove_item(item_name)
    remove = []
    remove << @menu.select{|key, value| key == item_name}
    @basket = @basket - remove
  end

  def already_in_basket?(item_name)
    @basket.select{|item| item === item_name}
  end

  def empty_basket
    @basket= []
  end


end
