require 'Restaurant'
require 'customer'

describe Restaurant do

  describe '#initialize' do

    it 'can display a menu with items and prices' do
      menu = {
        'chicken_burgers' => 2.50,
        'beef_burgers' => 2.50,
        'chips' => 1.00
      }

      expect(subject.menu).to include(menu)
    end
  end

  describe '#send_text' do
    it 'can send a confirmation text of order' do
      customer = double('customer')
      allow(customer).to receive(:get_order).and_return(['chicken_burgers', 2, 5.0])
      text = subject.send_text(customer.get_order)
      expect(text).to eq(true)
    end
  end
end
