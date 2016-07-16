class Menu

  attr_reader :menu

  def initialize
    @menu = current_menu
  end

  def show_menu
    str = ''
    menu.each do |arr|
      arr.each_pair do |k,v|
        str += "#{k}, Price : £#{v} // "
      end
    end
    str
  end

  private

  def current_menu
    [{'Pasta' => '4.50'},
     {'Garlic Bread' => '2.50'},
     {'Pizza' => '5.00'},
     {'Olives' => '1.50'},
     {'Ice cream' => '3.00'},
     {'Lemonade' => '1.00'}]
  end

end
