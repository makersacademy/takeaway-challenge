require 'menu'
describe Menu do
  describe 'show the menu' do
    let(:subject) { described_class.new(food_menu) }
    let(:food_menu) { [{ dish: "Burger", price: 5 }, { dish: "Pizza", price: 7 }] }
    it '#show_menu returns the menu' do
      expect(subject.show_menu).to eq "Burger - £5, Pizza - £7"
    end
  end
end
  