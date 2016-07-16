class Takeaway

  def menu
    @menu = {
      "King Prawn Noodles" => 5.80,
      "Chiken Fried Rice" => 3.90,
      "Beef Fried Rice" => 3.90,
      "Duck Fried Rice" => 5.60
    }
@menu.each{|k,v| puts "#{k} - £#{v}0"}
  end
end
