require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {Menu.new}


  describe '#view' do
	  context 'when making an order' do
	    it 'displays a menu' do
	  	  expect(takeaway.view_menu).to eq menu.dishes
	    end
	  end
  end

end