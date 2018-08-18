require 'takeaway.rb'

describe 'having a takeaway' do

  describe 'can see the menu' do
    let(:user) { Takeaway.new }
    let(:food) { [{ dish: "Burger", price: 5 }, { dish: "Pizza", price: 7 }] }
    let(:menu) { double :menu, food_menu: food, 
    show_menu: "#{food[0][:dish]} - £#{food[0][:price]}, #{food[1][:dish]} - £#{food[1][:price]}" 
    }
    it '#see_menu returns menu' do
      expect(user.see_menu(menu)).to eq "Burger - £5, Pizza - £7"
    end
  end
end
