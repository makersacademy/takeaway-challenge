require 'menu'
require 'items_selection'

class Order

attr_reader :menu, :order, :item, :total
def initialize
  @menu = menu
  @items = []
  @mobile_num = mobile_num
  @SMS_sent = false
  @total = 0.0
end

def create_order
  #hashnum.list.fetch(ID or name_of_dish"a")  to get price out of hash
  #exception will be key error if ID or dish not in hash
end

def calculate_total
end
end
