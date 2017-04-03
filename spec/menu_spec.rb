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

end
