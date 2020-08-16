require 'takeaway'

describe Takeaway do
let(:menu) { double :menu }
let(:first_order) {double :first_order }
subject {described_class.new(menu)}


it { is_expected.to respond_to(:pick) }
  
it { is_expected.to respond_to(:check_sum) }

  describe '#initialize' do
    it 'creates a menu' do
    expect(subject.menu).to eq menu
    end
  end

 describe '#new_order' do
   
   it 'creates a new order' do
    allow(subject).to receive(:new_order).and_return first_order
    
    allow(menu).to receive(:view).and_return(:Burger => 5.00, :Pizza => 4.00, :Fish => 6.00, :Chicken => 5.00)
    allow(menu).to receive(:[]).and_return 5.00
    subject.pick('Chicken', 1)
    expect(subject.new_order).to eq first_order
   end

 
  end

  describe '#check_sum' do
    it 'raises an error if sum is incorrect' do
        allow(subject).to receive(:add).and_return 11
        allow(first_order).to receive(:sum).and_return 9
        subject.new_order(first_order)
        p subject.order.sum
        expect{ subject.check_sum }.to raise_error 'incorrect sum'
    end
  end

  describe '#pick' do
    it 'returns items user selected' do
       
      allow(menu).to receive(:view).and_return(:Burger => 5.00, :Pizza => 4.00, :Fish => 6.00, :Chicken => 5.00)
      allow(menu).to receive(:[]).and_return 5.00
      subject.pick('Chicken', 2)
      expect(subject.pick('Burger', 2)).to eq([{"Chicken" => 5.00}, {"Chicken"=> 5.00}, {"Burger" => 5.00}, {"Burger" => 5.00}])
    end
  end
end