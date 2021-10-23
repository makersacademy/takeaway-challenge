require 'takeaway'
# require 'menu'

describe Takeaway do 
  
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { {"Prawn_chow_mein" => 1.99, "Chow Mein" => 4.50} } 

  context 'Takeaway has a menu' do 

    it 'contains dishes and prices' do
      # p takeaway.menu
      expect(takeaway.menu).not_to be_empty
    end
    
    it 'prints out menu' do
      printed_menu = "Dish: Prawn_chow_mein - Price: £1.99, Dish: Chow Mein - Price: £4.5"
      expect(takeaway.print_menu).to eq(printed_menu)
    end 
  end

end 