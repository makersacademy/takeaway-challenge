
class Takeaway
#see a list of dishes with prices
attr_reader :dishes

  def initialize
    @dishes = [
      4.50 => ["Chicken Korma","Chicken Katsu Curry"],
      3.00 => ["Veggie Burrito","Fries"],
      7.00 => ["Beef Burger", "Steak"],
      5.00 => ["Kinder Bueno Waffle", "Vanilla Ice Cream"]
    ]
  end
#see a list of dishes with prices
  def dishes_selection(mydish)
    mydish.each do |key, value|
      if value.include?(mydish)
        "Item: #{value} costs £#{key}"
      end
    end    
  end
    # An Example Of Possible Function to Implement
    # def score(hello)
    #   sum = 0
    #     hello.upcase.split("").each do |letter| #letter element is the varible inputted, to each of these letter as we know it is a string split in to its element
    #       @my_scribble.each do |key, value|
    #         if value.include?(letter)
    #           sum = sum + key
    #           "Item: #{item} costs £#{price}"
    #         end
    #       end
    #   end


end
