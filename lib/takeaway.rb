### code
require_relative 'customer'
require_relative 'menu_list'

class Takeaway
  
  def display
    # List::LIST
    List::LIST.map do |food, price|
      "#{food} : £#{price}\n"
    end
  end

end
