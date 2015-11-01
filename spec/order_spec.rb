require 'order'

describe Order do

  let(:order) { described_class.new }
  let(:dish1) { double(:dish1, name: "Dishy1", price: 3.50) }
  let(:dish2) { double(:dish2, name: "Dishy2", price: 5.00) }
  let(:dish3) { double(:dish3, name: "Dishy3", price: 4.99) }
  let(:dish4) { double(:dish4, name: "Dishy4", price: 5.99) }
  let(:restaurant1) { double(:restaurant1, select: dish1) }
  let(:restaurant2) { double(:restaurant2, select: dish2) }
  let(:restaurant3) { double(:restaurant3, select: dish3) }
  let(:restaurant4) { double(:restaurant4, select: dish4) }


  describe '#add_to_basket' do
    it 'calls the menu#select method' do
      expect(restaurant1).to receive(:select)
      order.add_to_basket(restaurant1, 1, 2)
    end

    it 'given the menu, dish number and quantity adds
        the dish/dishes to the order' do
      order.add_to_basket(restaurant1, 1, 2)
      expect( (order.basket[dish1] / dish1.price).to_i ).to eq 2
    end
  end

  describe '#summary' do
    it 'gives a summary of the order, grouping
        items and displaying prices with a total' do
      order.add_to_basket(restaurant1, 1, 2)
      order.add_to_basket(restaurant2, 1, 3)
      expected_output = "2x Dishy1 | £7.00\n" +
                        "3x Dishy2 | £15.00\n" +
                        "Total cost: £22.00"
      expect(order.summary).to eq expected_output
    end

    it 'raises an error if no dishes have been added to the order' do
      expect{ order.summary }.to raise_error "Basket empty"
    end

    it 'added test due to irb failure' do
      order.add_to_basket(restaurant4, 1, 3)
      expected_output = "3x Dishy4 | £17.97\n" +
                        "Total cost: £17.97"
      expect(order.summary).to eq expected_output
    end
  end

  describe '#submit' do

    before(:each) do
      allow(order).to receive(:issue_confirmation_text){nil}
    end

    it 'calls the #issue_confirmation_text
        method if payment matches total' do
      order.add_to_basket(restaurant1, 1, 2)
      order.add_to_basket(restaurant2, 1, 3)
      expect(order).to receive(:issue_confirmation_text)
      order.submit(22.00)
    end

    it 'raises an error if payment does not match the total cost' do
      order.add_to_basket(restaurant1, 1, 2)
      order.add_to_basket(restaurant2, 1, 3)
      error_msg = "Payment does not match total cost"
      expect{ order.submit(25.25) }.to raise_error error_msg
    end

    it '(irb fail) does not raise error when payment correct' do
      RSpec::Expectations.configuration.
        warn_about_potential_false_positives = false
      order.add_to_basket(restaurant1, 1, 2)
      order.add_to_basket(restaurant2, 1, 1)
      order.add_to_basket(restaurant3, 1, 1)
      error_msg = "Payment does not match total cost"
      expect{ order.submit(16.99) }.not_to raise_error error_msg
    end

    it 'raises an error if no dishes have been added to the order' do
      expect{ order.submit(0) }.to raise_error "Basket empty"
    end
  end

end
