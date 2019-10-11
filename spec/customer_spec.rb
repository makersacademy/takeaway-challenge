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
end
