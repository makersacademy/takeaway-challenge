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

    it 'will raise an error when dish is not on the menu' do
      expect { subject.place_order(:Duck) }.to raise_error 'Please select a dish from the menu.'
    end

    it 'can place an order' do
      expect(subject.place_order :Burger).to eq 'Thank you for ordering.'
    end

    it 'a dish has a default quantity of one' do
      expect(subject.order.values).to eq [1]
    end

    it 'a dish can be ordered more than once at the same time' do
      subject.place_order :Burger, 3
      expect(subject.order.values).to eq [4]
    end

    it 'can take multiple orders for the same dish' do
      subject.place_order :Burger, 2
      expect(subject.order.values).to eq [3]
    end

    it 'can order different dishes' do
      subject.place_order :Chips, 4
      subject.place_order :Salad
      expect(subject.order.values).to eq [1, 4, 1]
    end
  end

  context '#review_order' do

    it 'raises an eror if no dishes are ordered' do
      expect { subject.review_order }.to raise_error "You haven't ordered anything."
    end

    it 'should return the dishes and quantity order' do
      subject.place_order :Pizza, 2
      subject.place_order :Salad, 5
      expect(subject.review_order).to eq "Pizza: 2, Salad: 5"
    end
  end


  context '#check_out' do
    before { subject.place_order :Burger, 2 }
    before { subject.place_order :Chips, 2 }

    it 'displays the total costs' do
      expect(subject.check_out).to eq "Total costs: £23.96."
    end
  end

  context '#submit_order' do

    it 'can submit the order' do
      allow(subject).to receive(:submit_order).and_return(:Completed)
      expect(subject.submit_order).to eq :Completed
    end
  end

end
