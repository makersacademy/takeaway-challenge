class Menu
attr_reader :items

  def initialize
    @items = {
      'pizza' => 9.00,
      'pasta' => 8.00,
      'curry' => 10.00,
      'burger' => 11.00,
      'veggie burger' => 10.00
    }
  end

  def list
    string = ""
    @items.each do |name, price|
        string += "#{name} £#{price}0\n"
      end
    string
  end

  def add_item(name, price)
    @items[name] = price
  end

end
