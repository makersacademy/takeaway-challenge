class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = [
      {no: "%02d" % 1, dish: "Yase Soup", price: 2.55},
      {no: "%02d" % 2, dish: "Wan Tan Soup", price: 3.25},
      {no: "%02d" % 3, dish: "Tori Mushi", price: 3.05},
      {no: "%02d" % 4, dish: "Tom Yam Soup", price: 4.55},
      {no: "%02d" % 5, dish: "Tori Yam Soup", price: 3.55},
      {no: "%02d" % 6, dish: "Umami Soup", price: 4.55},
      {no: "%02d" % 7, dish: "Beef Tatar", price: 5.85},
      {no: "%02d" % 8, dish: "Moyashi Salad", price: 3.05},
      {no: "%02d" % 9, dish: "Kimchi Salad", price: 3.45},
      {no: "%02d" % 10, dish: "Hokkaido", price: 6.55},
      {no: "%02d" % 11, dish: "Shapu Salad", price: 4.05}
    ]
  end

  def view
    puts "Yume's menu".center(50)
    puts "-----------".center(50)
    puts "Dish ------------------------------ price".center(50)
    puts ""
    self.menu_items.each do |item|
      puts "#{item[:no]}.#{item[:dish]}".ljust(26) + "...EUR #{item[:price]}".rjust(26)
    end
  end
end
