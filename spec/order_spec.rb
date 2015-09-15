require 'order'

describe Order do

  let(:dish1) { double(:dish1, name: "Dishy1", price: 3.50) }
  let(:dish2) { double(:dish2, name: "Dishy2", price: 5.00) }
  let(:dish3) { double(:dish3, name: "Dishy3", price: 4.99) }
  let(:menu1) { double(:menu1, select: dish1) }
  let(:menu2) { double(:menu2, select: dish2) }
  let(:menu3) { double(:menu3, select: dish3) }


  describe '#add_to_basket' do
    it 'calls the menu#select method' do
      expect(menu1).to receive(:select)
      subject.add_to_basket(menu1, 1, 2)
    end

    it 'given the menu, dish number and quantity adds
        the dish/dishes to the order' do
      subject.add_to_basket(menu1, 1, 2)
      expect( (subject.basket[dish1] / dish1.price).to_i ).to eq 2
    end
  end

  describe '#summary' do
    it 'gives a summary of the order, grouping
        items and displaying prices with a total' do
      subject.add_to_basket(menu1, 1, 2)
      subject.add_to_basket(menu2, 1, 3)
      expected_output = "2x Dishy1 | £7.00\n" +
                        "3x Dishy2 | £15.00\n" +
                        "Total cost: £22.00\n"
      expect{ subject.summary }.to output(expected_output).to_stdout
    end

    it 'raises an error if no dishes have been added to the order' do
      expect{ subject.summary }.to raise_error "Basket empty"
    end
  end

  describe '#submit' do

    before(:each) do
      allow(subject).to receive(:issue_confirmation_text){nil}
    end

    it 'calls the #issue_confirmation_text
        method if payment matches total' do
      subject.add_to_basket(menu1, 1, 2)
      subject.add_to_basket(menu2, 1, 3)
      expect(subject).to receive(:issue_confirmation_text)
      subject.submit(22.00)
    end

    it 'raises an error if payment does not match the total cost' do
      subject.add_to_basket(menu1, 1, 2)
      subject.add_to_basket(menu2, 1, 3)
      error_msg = "Payment does not match total cost"
      expect{ subject.submit(25.25) }.to raise_error error_msg
    end

    it '(irb fail) does not raise error when payment correct' do
      RSpec::Expectations.configuration.
                          warn_about_potential_false_positives = false
      subject.add_to_basket(menu1, 1, 2)
      subject.add_to_basket(menu2, 1, 1)
      subject.add_to_basket(menu3, 1, 1)
      error_msg = "Payment does not match total cost"
      expect{ subject.submit(16.99) }.not_to raise_error error_msg
    end

    it 'raises an error if no dishes have been added to the order' do
      expect{ subject.submit(0) }.to raise_error "Basket empty"
    end
  end

end
