module Menu

  # @@menu = [ {:category => "Chips", :dish => "Large chips", :price => 2.45},
  #           {:category => "Chips", :dish => "Small chips", :price => 2.00},
  #           {:category => "Fish", :dish => "Cod", :price => 4.85},
  #           {:category => "Fish", :dish => "Plaice", :price => 4.85},
  #           {:category => "Fish", :dish => "Haddock", :price => 4.85},
  #           {:category => "Other", :dish => "Fishcake", :price => 1.15},
  #           {:category => "Other", :dish => "Battered sausage", :price => 1.15},
  #           {:category => "Other", :dish => "Spring roll", :price => 2.50},
  #           {:category => "Extras", :dish => "Bread roll", :price => 0.55},
  #           {:category => "Extras", :dish => "Curry sauce", :price => 1.30},
  #           {:category => "Extras", :dish => "Mushy peas", :price => 1.30}
  #         ]

          @@dishes = [ {"Large chips" => 2.45},
                    {"Small chips" => 2.00},
                    {"Cod" => 4.85},
                    {"Plaice" => 4.85},
                    {"Haddock" => 4.85},
                    {"Fishcake" => 1.15},
                    {"Battered sausage" => 1.15},
                    {"Spring roll" => 2.50},
                    {"Bread roll" => 0.55},
                    {"Curry sauce" => 1.30},
                    {"Mushy peas" => 1.30}
                  ]

                  def format_dish_by_index(index)
                    @@dishes[index].map { |key, value| "#{key} - £#{'%.2f' % value}" }
                  end

          def format_menu_items
            @@dishes.each_with_index.map { |dish, i| format_dish_by_index(i) }.join("\n")
            # format_dish_by_index(0)
          end

          # def format_dish_by_index(index)
          #   "#{@@menu[index][:dish]} - £#{'%.2f' % @@menu[index][:price]}"
          # end
          #
          # def categories
          #   @@menu.map {| dish |  dish[:category]  }.uniq
          # end
          #
          # def list_menu
          #   @@menu.map { |dish| "#{dish[:dish]} - £#{'%.2f' % dish[:price]}" }.join("\n")
          # end



end
