require 'menu'
describe Menu do
# This class contains all of the available dishes
  let(:dishes) do
    {
      "Cheeseburger" => 6,
      "Hamburger" => 5,
      "Pizza" => 7,
      "Milkshake" => 3,
      "Burrito" => 6
    }
  end

  describe '#dishes' do
    it 'has a list of dishes with prices' do
      expect(subject.dishes).to eq dishes
    end
  end

  describe '#view' do
    it 'prints a list of dishes' do
      printed_menu = "Cheeseburger £6.00, Hamburger £5.00, Pizza £7.00, Milkshake £3.00, Burrito £6.00"
      expect(subject.view).to eq printed_menu
    end
  end

end
