require 'takeaway'

describe Takeaway do

    it 'has a list of dishes' do
      expect(subject.menu).to eq([])
    end

    # it 'makes sure each meal in menu has a price' do
    #   expect(subject.meal_price(1)).to eq 1
    # end
    #
    # it 'allows new dishes to be created' do
    #   expect(subject.new_dish("Yummy meal")).to eq "Yummy meal"
    # end

    it 'saves dishes with their prices' do
      expect(subject.add_meal("meal", 2)).to eq( [{:meal => "meal", :price => 2}] )
    end

    it 'adds new meals to the menu' do
      expect{subject.add_meal("meal", 2.0)}.to change{subject.menu}
    end

end
