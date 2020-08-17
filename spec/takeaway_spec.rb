require 'takeaway'

describe Takeaway do
let(:menu) { double :menu }
let(:first_order) {double :first_order }
subject {described_class.new(menu)}


it { is_expected.to respond_to(:pick).with(2).arguments }
  
it { is_expected.to respond_to(:check_sum) }

it { is_expected.to respond_to(:basket) }

  describe '#initialize' do
    it 'creates a menu' do
    expect(subject.menu).to eq menu
    end
  end

 describe '#new_order' do
   
   it 'creates a new order' do
    allow(subject).to receive(:new_order).and_return first_order
    allow(menu).to receive(:menu).and_return({"Burger" => 5.00, "Pizza" => 4.00, "Fish" => 6.00, "Chicken" => 5.00})
    allow(menu).to receive(:view).and_return("Burger" => 5.00, "Pizza" => 4.00, "Fish" => 6.00, "Chicken" => 5.00)
    
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
       
      allow(menu).to receive(:view).and_return("Burger" => 5.00, "Pizza" => 4.00, "Fish" => 6.00, "Chicken" => 5.00)
      allow(menu).to receive(:menu).and_return({"Burger" => 5.00, "Pizza" => 4.00, "Fish" => 6.00, "Chicken" => 5.00}) 
      subject.pick('Chicken', 2)
      expect(subject.pick('Burger', 2)).to eq([{"Chicken" => 5.00}, {"Chicken"=> 5.00}, {"Burger" => 5.00}, {"Burger" => 5.00}])
    end
  end

  describe '#view' do
    it 'returns the menu list' do
        allow(menu).to receive(:view).and_return({"Burger" => 5.00, "Pizza" => 4.00, "Fish" => 6.00, "Chicken" => 5.00})
        expect(subject.view).to eq({"Burger" => 5.00, "Pizza" => 4.00, "Fish" => 6.00, "Chicken" => 5.00}) 
    end
  end

  describe '#basket' do
    it 'returns total cost of order' do 
        allow(menu).to receive(:menu).and_return({"Burger" => 5.00, "Pizza" => 4.00, "Fish" => 6.00, "Chicken" => 5.00}) 
        subject.pick('Chicken', 2)
        subject.pick('Fish', 1)
        subject.pick('Pizza', 1)
        expect(subject.basket).to eq 20
    end
  end
end