class Takeaway

  def initialize
    @menu = {
      Biltong: 5,
      Droewors: 6,
      Fritos: 2,
      Fizzer: 1,
      Chops: 9,
      Boerewors: 7,
      Bobotie: 8,
    }
  end

  def menu
    @menu.each do |food, price|
      puts "The #{food} costs £#{price}"
    end
  end
end
