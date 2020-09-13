require_relative 'takeaway'
require_relative 'confirm'

require 'rubygems'
require 'twilio-ruby'

class Customer 

attr_reader :basket, :takeaway

  def initialize(takeaway = Takeaway) 
    @basket = []
    @takeaway = takeaway.new
    @text = Text.new
  end 

  def view(takeaway)
    takeaway.view
  end 

  def add(dish)
    a = dish.to_sym
    @basket << @takeaway.menu.select {|k| k == a}
  end 

  def total
    sum = 0 
    @basket.each { |hash| hash.each_value {|v| sum += v}}
    sum
  end 

  def place_order
    fail "Nothing in basket" if @basket == []
    @text.sms
  end 

end 