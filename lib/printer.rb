class Printer

  def initialize(col_width)
    @col_width = col_width
    @total_width = col_width[0] + col_width[2]
    @print_array = []
  end

  def print(input, header)
    @input = input.insert(0, { :description => "header" })
    @header = header
    justify_input
    print_input
    clear_job
  end

  def justify_input
    itr = 1
    @input.each do |row|
      case row[:description]
        when "header"
          justify_header
        when "total"
          justify_total(row)
        else
          justify_table(row, itr)
          itr += 1
      end
    end
  end

  def justify_header
    header = @header.center(@total_width + 4)
    @print_array.push(header)
  end

  def justify_total(total)
    total_name = "Total:".rjust(@col_width[0] + 3)
    total_price = "#{('£%.2f' % total[:price]).rjust(@col_width[2] + 1)}"
    @print_array.push("#{total_name} #{total_price}")
  end

  def justify_table(item, itr)
    item_name = item[:name].ljust(@col_width[0])
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
