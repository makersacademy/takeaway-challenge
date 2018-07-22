class Menu
  attr_reader :whiskies, :has_item, :price
  
  def initialize(whiskies)
    @whiskies = {
      :Lagavulin_16yo_Islay => 49.50,
      :Laphroaig_10yo_Islay => 30.00,
      :Talisker_Skye_Isle_of_Skye => 25.80
    }
  end

  def show
    whiskies.map do |item, price|
      "%s £%.2f" % [item.to_s, price]
    end.join(", ") # these 2 lines are from the exemplar video
  end

  def has_item?(item)
    !!whiskies[item] # double!! returns a boolean value of true, instead of nil
  end

  def price(item)
    p whiskies[item]
  end
end
      # :Ardbeg_10yo_Islay => 40.50,
      # :Glenfidditch_12yo_Highlands => 34.20,
      # :Dalmore_15yo_Highlands => 60.70,
      # :Aberlour_10yo_Speyside => 25.00,
      # :Cotswolds_Single_Malt_Whisky_Cotswolds => 45.10,
      # :Dalwhinnie_15yo_Highlands => 36.40,
      # :Hibiki_Japan => 55.00,
      # :Yamazaki_Japan => 48.90,
      # :Bob_Dylan_Heavens_Door_Whiskey_Nashville => 50
