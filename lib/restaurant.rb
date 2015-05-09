require_relative 'customer.rb'

class Restaurant
  attr_reader = :dishes

  def initialize
    @dishes = { 'Burger' => '£10',
                'Hotdog' => '£8',
                'Chicken Wings' => '£9',
                'Chips' => '£5',
                'Coke' => '£2',
                'Lemonade' => '£2' }
  end

  def dishes
    @dishes
  end
end
