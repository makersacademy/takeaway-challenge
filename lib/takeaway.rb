require 'selection'
require 'sms'

class Takeaway

  def initialize(menu: menu, selection: nil, sms: nil)
    @menu = menu 
    @selection = selection || Selection.new(menu)
    @sms = sms || SMS.new 
  end

  def print_menu
    menu.print 
  end

  def select_dishes(dishes)
    add_dishes(dishes)
    sms.deliver
    selection.total
  end

  private 

  def add_dishes(dishes)
    dishes.each { | dish, number_of_dish |
      selection.add(dish, number_of_dish)
    }
  end

  attr_reader :menu, :selection, :sms
end