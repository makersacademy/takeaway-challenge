module PrettyFormat

  include Menu

  def pretty_format(hash, total=nil)
    item_number = 0
    puts "\n"
    hash.each do |k,v|
      puts total ? "#{item_number += 1}. #{k.join.to_s} (£#{to_two(ALL_DISHES[k.join.to_sym])}) x #{v.to_s} = £#{to_two(ALL_DISHES[k.join.to_sym].to_f * v.to_f)}" : "#{item_number += 1}. #{k.to_s}: £#{sprintf "%.2f", v.to_s}"
    end
    puts "\nTotal = £#{to_two(total)}" if total
    puts "\n"
  end

  def to_two(float)
    sprintf "%.2f", float
  end

end
