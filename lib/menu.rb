class Menu
  attr_accessor :data
  def initialize(menu_data)
   @data = menu_data
  end

  def print
    string = ""
    @data.each do |data|
      string << "#{data[:id]}: #{data[:name]}" +
                " £#{format_price(data[:price])}\n" +
                "   #{data[:description]}\n"
    end
    puts string
  end

  private
  def format_price(pence)
    pence_array = arrayify_pence(pence)
    if less_than_pound?(pence)
      2.times { pence_array.unshift("0") }
      add_decimal_point(pence_array)
    else
      add_decimal_point(pence_array)
    end
  end

  def add_decimal_point(pence_array)
    pence_array.insert(-3, '.').join
  end

  def arrayify_pence(pence)
    pence.to_s.chars
  end

  def less_than_pound?(pence)
    pence.to_s.size <= 2
  end
end
