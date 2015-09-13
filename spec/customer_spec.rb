require 'customer'

describe Customer do

  context '#menu' do

    it 'can see the menu' do
      allow(subject).to receive(:menu).and_return(:Burger)
      expect(subject.menu).to eq :Burger
    end
  end

  context '#place_order' do

    before { subject.place_order :Burger }

    it 'will raise an error when not on the menu' do
      expect { subject.place_order(:Duck) }.to raise_error 'Please select a dish from the menu.'
    end

    it 'can place an order' do
      expect(subject.place_order :Burger).to eq 'Thank you for ordering!'
    end

    it 'a dish has a default quantity of one' do
      expect(subject.order.values).to eq [1]
    end

    it 'the same dish can be ordered more than one time' do
      subject.place_order :Burger, 3
      expect(subject.order.values).to eq [4]
    end

    it 'can take multiple orders for the same dish' do
      subject.place_order :Burger, 2
      expect(subject.order.values).to eq [3]
    end

    it 'can order several dishes' do
      subject.place_order :Chips, 4
      subject.place_order :Salad
      expect(subject.order.values).to eq [1, 4, 1]
    end
  end

  context '#check_out' do
    before { subject.place_order :Burger, 2 }
    before { subject.place_order :Chips, 2 }

    it 'displays the total costs for each dish and the overall sum' do
      expect(subject.check_out).to eq 1
    end
  end

  context '#submit_order' do

    it 'can submit the order' do
      allow(subject).to receive(:submit_order).and_return(:Completed)
      expect(subject.submit_order).to eq :Completed
    end
  end

end
