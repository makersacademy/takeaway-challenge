class Takeaway

  def initialize
    @selection = []
  end

  def menu
    [
      { "DAIFUKU" => 2 },
      { "ICHIGO"  => 3 }
    ]
  end

  def select(item, qty)
    @selection << { dish: item, qty: qty }
  end

  def order_summary
    i, summary = 0, 0
    until i == @selection.count do
      summary += @selection[i][:qty] * menu[i][@selection[i][:dish]]
      i += 1
    end
    summary
  end

end
