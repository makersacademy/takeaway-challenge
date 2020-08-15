require 'takeaway'

describe Takeaway do
let(:menu) { double :menu }
let(:first_order) {double :first_order }
subject {described_class.new(menu)}


it { is_expected.to respond_to(:pick) }
  
  describe '#initialize' do
    it 'creates a menu' do
    expect(subject.menu).to eq menu
    end
  end

 describe '#new_order' do
   
   it 'creates a new order' do
    allow(subject).to receive(:new_order).and_return first_order
    
    allow(menu).to receive(:view).and_return(:Burger => 5.00, :Pizza => 4.00, :Fish => 6.00, :Chicken => 5.00)
    subject.pick 
    expect(subject.new_order).to eq first_order
   end

   # it 'returns items user selected' do
        
    #    allow(menu).to receive(:view).and_return(:Burger => 5.00, :Pizza => 4.00, :Fish => 6.00, :Chicken => 5.00)
   #   expect(subject.pick).to eq :Chicken => 5.00, :Burger => 5.00
 #   end
  end
end