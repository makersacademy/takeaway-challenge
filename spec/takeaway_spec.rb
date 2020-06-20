require 'takeaway'
describe Takeaway do
  subject(:takeaway) { Takeaway.new }  
  describe '#print_menu' do
    it ' should show the dishes and prices on the menu ' do
      expect(takeaway).to respond_to(:print_menu)
    end
    it 'should show the dishes and prices on the menu ' do
      expect(takeaway.print_menu).to eq("Sushi  £6.99")
    end
  end
end    
