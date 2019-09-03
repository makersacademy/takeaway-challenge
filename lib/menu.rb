class Menu
  attr_reader :menu_hash

  def initialize
    @menu_hash = {
    "Korma" => 4.99,
    "Bhuna" => 2.99,
    "Rogan-josh" => 3.29,
    "Peshwari naan" => 1.99,
    "Poppadom" => 0.80
    }
  end

  def menu_reader
    @menu_hash.each { |k,v| puts "#{k}:   £#{v.to_f}" }
  end

end