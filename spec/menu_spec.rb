# "test" is used as the test instance, for easy understanding
require 'menu'

describe Menu do
  subject(:menu) { described_class.new(fwhiskies) }

  let(:fwhiskies) do { 
    :Lagavulin_16yo_Islay => 49.50,
    :Laphroaig_10yo_Islay => 30.00,
    :Talisker_Skye_Isle_of_Skye => 25.80
    }
  end
  
  context 'content' do
    
    it 'has a list of items with prices' do
      expect(subject.whiskies).to eq(fwhiskies)
    end

    it 'shows a list of items with prices' do
      displayed_menu = "Lagavulin_16yo_Islay £49.50, Laphroaig_10yo_Islay £30.00, Talisker_Skye_Isle_of_Skye £25.80"
      expect(subject.show).to eq(displayed_menu)
    end
  end

  context 'availability' do

    it 'confirms that an item is on menu' do
      expect(menu.has_item?(:Laphroaig_10yo_Islay)).to be true
    end

    it 'warns that an item is not on menu' do
      expect(menu.has_item?(:Cola)).to be false
    end
  end

  context 'cost' do
    
    it 'checks that the price is right' do
      expect(menu.price(:Lagavulin_16yo_Islay)).to eq(fwhiskies[:Lagavulin_16yo_Islay])
    end
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
