require_relative 'customer'

class Restaurant
  attr_accessor = :menu

  def initialize
    @menu = { 'Burger' => '£10',
              'Hotdog' => '£8',
              'Chicken Wings' => '£9',
              'Chips' => '£5',
              'Coke' => '£2',
              'Lemonade' => '£2' }
  end

  def menu
    @menu
  end
end
