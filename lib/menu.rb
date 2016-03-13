class Menu

  attr_reader :list

  LIST = [
          {name: 'miso soup', price: 1.5},
          {name: 'sticky rice', price: 2},
          {name: 'tofu salad', price: 4.5},
          {name: 'sushi', price: 7},
          {name: 'okonomi-yaki', price: 10},
          {name: 'tonkotsu ramen', price: 12},
          {name: 'katsu curry', price: 12}
          ].freeze

  def initialize
    @list = make_list
  end

  def find_price(dish)
    raise 'This dish is not available' unless in_menu?(dish)
    LIST.each {|i| return i[:price] if i[:name] == dish}
  end

  private

  def make_list
    @list = ''
    LIST.each {|dish| @list << "#{dish[:name]}: £#{dish[:price]}\n"}
    @list.dup.freeze
  end

  def in_menu?(dish)
    LIST.any? {|i| i[:name] == dish}
  end
end
