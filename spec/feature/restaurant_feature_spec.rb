require 'restaurant'

describe Restaurant do
  subject(:restaurant){described_class.new}

  xdescribe '#show_menu' do

    it 'outputs the list of menu items' do
      expect{restaurant.show_menu}.to output(Restaurant::MENU.each {|key, value| "#{key} = #{value}"}).to_stdout
    end

  end


  describe '#place_order' do

    it 'add the item to the order and confirms' do
      restaurant.show_menu
      expect{restaurant.place_order("prawn summer rolls", 4)}.to output("4 prawn summer rolls added to your order").to_stdout
    end


  end

end
