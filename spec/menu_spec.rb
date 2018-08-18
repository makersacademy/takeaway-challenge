require 'menu'
describe Menu do
  describe 'show the menu' do
    let(:subject) { described_class.new(food_menu) }
    let(:food_menu) { [{ dish: "Burger", price: 5 }, { dish: "Pizza", price: 7 }] }
    it '#show_menu returns the menu' do
      expect(subject.show_menu).to eq "Burger - £5, Pizza - £7"
    end
  end
  describe 'returns price of dish' do
    it 'returns price of dish' do
      expect(subject.get_price("Pizza")).to eq 7
    end
  end
  describe 'order a dish' do
    it 'order dish from the menu' do
      expect(subject.order_dish("Pizza", 1)).to eq "Ordered - Pizza x 1"
    end
    it 'order dish not on the menu' do
      expect { subject.order_dish("Sushi", 1) }.to raise_error "Sushi not on the menu"
    end
  end
end
  