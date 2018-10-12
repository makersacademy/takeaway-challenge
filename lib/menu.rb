module Menu

  @@menu = [ {:category => "Chips", :dish => "Large chips", :price => 2.45},
            {:category => "Chips", :dish => "Small chips", :price => 2.00},
            {:category => "Fish", :dish => "Cod", :price => 4.85},
            {:category => "Fish", :dish => "Plaice", :price => 4.85},
            {:category => "Fish", :dish => "Haddock", :price => 4.85},
            {:category => "Other", :dish => "Fishcake", :price => 1.15},
            {:category => "Other", :dish => "Battered sausage", :price => 1.15},
            {:category => "Other", :dish => "Spring roll", :price => 2.50},
            {:category => "Extras", :dish => "Bread roll", :price => 0.55},
            {:category => "Extras", :dish => "Curry sauce", :price => 1.30},
            {:category => "Extras", :dish => "Mushy peas", :price => 1.30}
          ]

  def format_menu_items
    @@menu.map { |dish| "#{dish[:dish]} - £#{'%.2f' % dish[:price]}" }.join("\n")
  end


end
