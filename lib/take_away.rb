class TakeAway
  attr_reader :menu

  def initialize
    @menu = []
  end

  def read_menu(file = import_file)
    file
    menu.each do |item|
      puts "#{item[:index]}. #{item[:item]}: #{item[:amount]}"
    end
  end

  private

  def import_file
    file = File.open("./lib/menu.csv", "r")

    file.readlines.each_with_index do |line, index|
      item, amount = line.chomp.split(',')
      assign_values(index + 1, item, amount)
    end
    file.close
  end

  def assign_values(index, item, amount)
    @menu << { index: index, item: item, amount: amount }
  end
end
