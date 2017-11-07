require 'order'

describe Order do
  let(:dish) { dish = double(:dish, name: "Coconut Cake", price: "6") }
  let(:dish2) { dish2 = double(:dish2, name: " Ginger Tea", price: "2") }

  describe 'attributes' do
    it 'has a total equal to 0' do
      expect(subject.total).to eq(0)
    end

    it 'there is nothing in the basket' do
      expect(subject.basket).to eq({})
    end

    it 'the status is not finalised' do
      expect(subject.status).to eq(:unfinalised)
    end
  end

  describe '#complete_order' do
    it 'changes the status to finalised' do
      subject.complete_order
      expect(subject.status).to eq(:finalised)
    end
  end

  describe '#add_to_basket' do
    before(:each) do
      subject.add_to_basket(dish)
    end

    it 'checks that the order has been added to the basket' do
      expect(subject.basket).to eq({ dish => 1 })
    end

    it 'updates the total after the order has been placed' do
      expect(subject.total).to eq(6)
    end
  end

  describe '#basket_summary' do
    it 'prints to the screen' do
      subject.add_to_basket(dish)
      subject.add_to_basket(dish2)
      it_prints = "1. #{dish.name.upcase} -- Price #{dish.price}$ -- Quantity 1\n"
      it_prints += "2. #{dish2.name.upcase} -- Price #{dish2.price}$ -- Quantity 1\n"
      expect { subject.basket_summary }.to output(it_prints).to_stdout
    end
  end

end
