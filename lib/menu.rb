class Menu

  LIST = [
          {name: 'Miso soup', price: 1.5},
          {name: 'Sticky rice', price: 2},
          {name: 'Tofu salad', price: 4.5},
          {name: 'Sushi', price: 7},
          {name: 'Okonomi-yaki', price: 10},
          {name: 'Tonkotsu Ramen', price: 12},
          {name: 'Katsu curry', price: 12}
          ].freeze

  def initialize
    @list = ''
  end

  def list
    LIST.each {|dish| @list << "#{dish[:name]}: £#{dish[:price]}\n"}
    @list.dup.freeze
  end
end
