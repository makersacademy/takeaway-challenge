class Printer

  def initialize(col_width)
    @col_width = col_width
    @total_width = col_width[0] + col_width[2]
    @print_array = []
  end

  def print(input)
    @input = input
    clone_input
    justify_input
    print_input
    clear_job
  end

  def clone_input

  end

  def justify_input
    itr = 1
    @input.each do |item|
      case item[:description]
        when "title"
          justify_title(item)
        when "total"
          justify_total(item)
        else
          justify_table(item, itr)
          itr += 1
      end
    end
  end

  def justify_title(item)
    item_name = item[:name].center(@total_width + 4)
    @print_array.push("#{item_name}")
  end

  def justify_total(item)
    item_name = item[:name].rjust(@col_width[0] + 3)
    item_price = "#{('£%.2f' % item[:price]).rjust(@col_width[2] + 1)}"
    @print_array.push("#{item_name} #{item_price}")
  end

  def justify_table(item, itr)
    item_name = item[:name].ljust(@col_width[0])
    item_description = item[:description].ljust(@col_width[1])
    item_price = "#{('£%.2f' % item[:price]).rjust(@col_width[2] + 1)}"
    @print_array.push("#{'%.2d' % itr} #{item_name} #{item_price}")
  end

  def print_input
    puts @print_array
  end

  def clear_job
    @input = nil
    @print_array = []
  end

end
