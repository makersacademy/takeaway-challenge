class Takeaway

  def initialize
    @menu = {
      'onion_bhaji' => 3.50,
      'chicken dhansak' => 7.95,
      'lamb jalfrezi' => 8.95
    }
  end

  def menu
    @menu.dup
  end
  
end
