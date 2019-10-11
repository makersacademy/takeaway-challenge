require 'customer'

describe Customer do

  describe '#see_menu' do

    it  'can display the menu to the customer' do
      restaurant = double('restaurant')
      allow(restaurant).to receive(:menu).and_return({
        'chicken_burgers' => 2.50,
        'beef_burgers' => 2.50,
        'chips' => 1.00
      })
      expect(subject.see_menu(restaurant)).to eq(
        "chicken_burgers are £2.5\nbeef_burgers are £2.5\nchips are £1.0\n"
      )
    end
  end

  describe '#get_order' do

    it 'can test if the user inputs a correct order, raises an error if not and fails test' do
      restaurant = double('restaurant')
      allow(restaurant).to receive(:menu).and_return({
        'chicken_burgers' => 2.50,
        'beef_burgers' => 2.50,
        'chips' => 1.00
      })
      order = subject.get_order(restaurant)
      expect { raise order }.not_to raise_error 'Order was invalid'
    end
  end
end
