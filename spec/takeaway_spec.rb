require 'takeaway'
describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu) }  
  let(:menu) { double :menu, print: printed_menu }
  let(:printed_menu) { "Sushi: £8.00" }
  describe '#print_menu' do
    it ' should show the dishes and prices on the menu ' do
      expect(takeaway).to respond_to(:print_menu)
    end
    it 'should show the dishes and prices on the menu' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end
  
end    
