require 'takeaway'

describe TakeAway do

 subject(:new_order) {described_class.new}

 # let(:menu) { double(:menu, dishes: { 'Mealworm_Croquettes' => 1.20 }) }
 # let(:dish) { 'Mealworm_Croquettes' }
 # let(:quantity) { 2 }

  describe '#show menu' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'can show the user the menu' do
        expect(new_order.show_menu).to include(
          "Mealworm Croquettes" => 1.20,
          "Larve Paprika Crisps" => 1.50,
          "Crunchy Chicken Claw" => 2.40,
          "Zingy Zebra Bites" => 3.80,
          "Springbok rolls" => 4.30,
          "Buffalow salad" => 10.20,
          "Ostrich steak" => 13.55,
          "Crocodile burger" => 14.25,
          "Kangaroo con carne" => 15.20,
          "Python soup" => 17.50,
          "Pufferfish cakes" => 21.50,
        )
      end
    end

  describe '#select dishes' do
    # As a customer
    # So that I can new_order the meal I want
    # I would like to be able to select some number of several available dishes
    it 'raises error if user selects unavailable item' do
      message = "Sorry this item is not on the menu"
      expect{new_order.take_order("something")}.to raise_error message
    end

  end
  #
  describe '#basket' do
    it 'shows the summary of the basket' do
      new_order.take_order("Mealworm Croquettes", 2)
      expect(new_order.summary).to eq("2: Mealworm Croquettes")
    end
  end
end
