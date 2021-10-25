require 'takeaway'

describe Takeaway do 
  
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { {"Prawn chow mein" => 4.50, "Egg fried rice" => 2.50} } 

  context 'Takeaway has a menu' do 

    it 'contains dishes and prices' do
      expect(takeaway.menu).not_to be_empty
    end
    
    it 'prints out menu' do
      printed_menu = "Dish: Prawn chow mein - Price: £4.5, Dish: Egg fried rice - Price: £2.5"
      expect(takeaway.print_menu).to eq(printed_menu)
    end 
  end

  context 'Placing an order' do 

    it 'allows user to select a number of dishes to order' do
      p takeaway 
      expect(takeaway.place_order("Prawn chow mein", 2)).to eq("Dishes selected: Prawn chow mein x 2")
    end
  end

end 