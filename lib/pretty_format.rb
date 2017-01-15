module PrettyFormat

  def pretty_format(hash, total=nil)
    item_number = 0
    puts "\n"
    hash.each do |k,v|
      puts total ? "#{item_number += 1}. #{k.to_s}: Quantity - #{v.to_s}" : "#{item_number += 1}. #{k.to_s}: £#{sprintf "%.2f", v.to_s}"
    end
    puts "\nTotal = £#{sprintf "%.2f", total}" if total
    puts "\n"
  end

end
