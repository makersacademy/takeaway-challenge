require 'takeaway'

describe TakeAway do
  let(:name) { "McNuggets" }
  let(:price) { 3.00 }
  let(:dish) { double('dish', name: name, price: price) }

  context '#see_menu' do
    it { is_expected.to respond_to(:see_menu) }
    
    xit 'has a menu that can be read' do
      takeaway = Takeaway.new
      expect(takeaway.see_menu).to eq
    end

  end
  
end
