require_relative '../lib/order'

describe Order do
  

  describe 'view_menu' do
    
    it 'should display the menu from the takeaway' do
      takeaway_double = double(:takeaway, :display_menu => {"Dish 1" => 10, "Dish 2" => 12} )
      subject.view_menu(takeaway_double)
      expect(subject).to respond_to(:view_menu).with(1).argument
      expect(takeaway_double).to have_received(:display_menu)
    end
  end
end
