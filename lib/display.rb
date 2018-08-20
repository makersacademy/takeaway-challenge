require_relative 'display'

class Display

  def menu(current_menu)
    current_menu.each_with_index { |item, index| puts "#{index + 1}: #{item[:food]}\
 £#{item[:price]}"
    }
  end

  def order(selected)
    total = 0
    sort_order(selected).each_with_index do |item, index|
      total += (item[0][:price] * item[1])
      print_out(item, index)
    end
    puts "Total: £#{total}"
  end

  def single_item(item, amount)
    puts "#{item[-1][:food]} x#{amount} £#{item[-1][:price]*amount}"
  end

  private

  def sort_order(selected)
    selected.group_by { |item| item }.map { |k, v| [k, v.count] }
  end

  def print_out(item, index)
    puts "#{index + 1}: #{item[0][:food]} x#{item[1]} - £#{item[0][:price] * item[1]}"
  end
end
