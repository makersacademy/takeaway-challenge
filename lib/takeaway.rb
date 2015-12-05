

class Takeaway

  attr_reader :menu

  def initialize
    @menu = {
          'Satay'               => 4.95,
          'Spring rolls'        => 2.95,
          'Tom yum soup'        => 4.75,
          'Green curry'         => 6.45,
          'Red curry'           => 6.45,
          'Panang curry'        => 6.45,
          'Pad thai'            => 5.95,
          'Pad see ew'          => 6.00,
          'Steamed rice'        => 2.60,
          'Coconut rice'        => 2.95
        }
  end

  def add_to_order
  end

end
