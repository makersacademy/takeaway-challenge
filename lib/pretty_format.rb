module PrettyFormat

  def pretty_format(menu)
    item_number = 0
    puts "\n"
    menu.each do |k,v|
      puts "#{item_number += 1}. #{k.to_s}: £#{sprintf "%.2f", v.to_s}"
    end
  end

end
