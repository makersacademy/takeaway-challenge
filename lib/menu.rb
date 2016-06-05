class Menu

  def initialize
    @contents = { :hamburger => 3,
                  :cheeseburger => 4,
                  :'quarter pounder' => 6,
                  :'curry chips' => 3,
                  :'chips' => 2,
                  :'chicken wrap' => 4,
                  :'veggie burger' => 5,
                }
  end

  def price(dish)
    @contents[dish]
  end

  def remove_item(dish)
    fail "#{ dish } not on menu" unless has?(dish)
    @contents.delete(dish)
  end

  def add_item(dish,price)
    @contents[dish] = price
  end

  def has?(dish)
    @contents.include?(dish)
  end

  def display
    output = "Menu\n#{ "="*40 }\nDish#{ " "*30 } Price\n" + "-"*40 + "\n"

    @contents.each do |item, price|
    output += "#{ item.to_s.ljust(33) } £#{ ("%.2f"%price(item)).rjust(5) }\n"
    end

    output += "="*40 + "\n"
  end
end
