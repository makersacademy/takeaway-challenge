module Takeaway

  def menu
    item_list = {
              'pizza' => 10.00,
              'burrito' => 6.00,
              'burger' => 7.00,
              'chicken' => 5.00,
              'chips' => 2.00
            }

    item_list.each { |item, price| puts "#{item}: £#{price}"}
  end
end
