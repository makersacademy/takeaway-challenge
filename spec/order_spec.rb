require_relative '../lib/order'

describe Order do
  
  describe 'view_menu' do
    it 'should display the menu from the takeaway' do
      takeaway_double = double(:takeaway, :display_menu => { "Dish 1" => 10, "Dish 2" => 12 })
      subject.view_menu(takeaway_double)
      expect(subject).to respond_to(:view_menu).with(1).argument
      expect(takeaway_double).to have_received(:display_menu)
    end
  end

  describe '#add_dish' do
    it 'should accept a takeaway, dish and quantity' do
      takeaway_double = double(:takeaway)
      allow(takeaway_double).to receive(:menu).and_return( {"Dish 1": 10} )
      subject.add_dish(takeaway_double, "Dish 1", 1)
      expect(subject).to respond_to(:add_dish).with(3).argument
    end
  end
      
end
