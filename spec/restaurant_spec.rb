require 'restaurant'
#require 'yaml'

describe Restaurant do

  let(:menu_check) {described_class.new}
  let(:menu) {double(:menu, name: 'Rice', price: 1.50)}
  subject(:takeaway) {described_class.new}

  describe '#initialize' do
   it 'will have an empty array for the order' do
     expect(subject.order).to be_empty
   end
  end

  describe '#display_menu' do
    it 'shows a copy of the menu' do
     expect(subject.display_menu).to include(name: 'Rice', price: 1.50)
    end

    it 'menu cant be altered by customer' do
      subject.display_menu.delete('Rice')
      expect(subject.display_menu).to eq menu_check.display_menu
    end
  end

  describe '#add_to_order' do
    it 'adds a selected dish to the order' do
      subject.add_to_order('Rice')
      expect(subject.order).to include(name: 'Rice', price: 1.50)
    end

    it 'only adds one dish unless told to add more' do
      subject.add_to_order('Rice')
      expect(subject.order.length).to be 1
    end

    it 'adds the number of specified dished to the array' do
      subject.add_to_order('Rice', 12)
      expect(subject.order.length).to be 12
    end

    it 'won\'t add a dish that isn\'t on the menu' do
      expect{ subject.add_to_order('Balti') }.to raise_error "Balti isn't available"
    end

    it 'will add a dish even if not formatted correctly' do
      subject.add_to_order("RicE")
      expect(subject.order).to include(name: 'Rice', price: 1.50)
    end
  end

  describe '#cost' do
    it 'calculates the cost of the order' do
      subject.add_to_order('Rice', 4)
      subject.add_to_order('Tikka', 9)
      expect(subject.cost).to eq "This order will cost £51.00"
    end
  end

  describe '#confirm_order' do

    before do
      allow(subject).to receive(:send)
    end

    it 'checks the user hasnt given the wrong amount' do
      subject.add_to_order('Rice')
      expect{subject.confirm_order(100)}.to raise_error 'Please enter the correct amount'
    end

    it 'sends a text to confirm the order' do
      expect(subject).to receive(:send)
      subject.add_to_order('Rice')
      subject.cost
      subject.confirm_order(1.50)
    end
  end

end
