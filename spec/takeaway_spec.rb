require 'takeaway'
describe Takeaway do
  describe 'can see the menu' do
    let(:subject) { described_class.new(Order.new) }
    let(:food) { [{ dish: "Burger", price: 5 }, { dish: "Pizza", price: 7 }] }
    let(:menu) { double :menu, food_menu: food, 
    show_menu: "#{food[0][:dish]} - £#{food[0][:price]}, #{food[1][:dish]} - £#{food[1][:price]}" 
    }
    it '#see_menu returns menu' do
      expect(subject.see_menu(menu)).to eq "Burger - £5, Pizza - £7"
    end

    describe 'order a dish' do
      it '#order returns order' do
        expect(subject.order("Burger", 1)).to eq "Ordered - Burger x 1"
      end
    end
  end
end
