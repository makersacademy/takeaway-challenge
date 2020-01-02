class Printer
  def initialize(list = List.new)
    @list = list
  end

  def print
    @list.list.each do |category, items|
      puts category.upcase
      items.each do |item, price|
        puts "#{item}: £ #{price}"
      end
      puts "\n"
    end
  end
end
