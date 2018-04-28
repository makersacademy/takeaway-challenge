class Menu

  def initialize
    @items = [
      { pappadom_preach: 0.50 },
      { tikka_to_ride: 4.75 },
      { livin_dhal: 3.25 },
      { jalfrezi_rock: 5.50 },
      { saag_ado: 3.00 },
      { paperback_raita: 0.75 },
      { korma_police: 4.50 },
      { dhansak_queen: 5.00 },
      { bhaji_trousers: 2.75 },
      { rice_rice_baby: 2.50 }
    ]
  end

  def display
    @items.each do |item|
      item.each do |key, value|
        puts "#{key} : #{value}"
      end
    end
  end

end
