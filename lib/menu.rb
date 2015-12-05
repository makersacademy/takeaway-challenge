class Menu

  attr_reader :pricelist

  def initialize
    @pricelist = {
        'Satay'               => 4.50,
        'Spring rolls'        => 2.20,
        'Tom yum soup'        => 4.90,
        'Green curry'         => 6.50,
        'Red curry'           => 6.50,
        'Panang curry'        => 6.50,
        'Pad thai'            => 5.50,
        'Pad see ew'          => 6.80,
        'Steamed rice'        => 2.50,
        'Coconut rice'        => 2.80
        }
  end


end
