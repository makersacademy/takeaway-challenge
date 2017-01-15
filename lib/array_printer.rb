module ArrayPrinter

  def self.print_array(array)
    print stringify(array)
  end

  private

  def self.stringify(array)
    array.map.with_index { |item, idx| "#{idx + 1}. #{item.name} #{item.price}" }.join("\n")
  end

end
