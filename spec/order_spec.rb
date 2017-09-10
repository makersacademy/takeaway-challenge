require './lib/order.rb'

describe Order do
  subject(:order) {described_class.new}
  let(:dish) {"burger"}
  let(:text) {double :text}

  it 'starts with an empty basket' do
    expect(order.basket).to eq []
  end

  describe "# choose_order" do
    it 'takes a burger order and passes it to the basket' do
      order.choose_order(dish)
      expect(order.basket[0][:item]).to eq dish.capitalize
    end

    it 'takes a pizza order and passes it to the basket' do
      order.choose_order("pizza")
      expect(order.basket[0][:item]). to eq "Pizza"
    end

    it'takes a kebab order and passes it to the basket' do
      order.choose_order("kebab")
      expect(order.basket[0][:item]).to eq "Kebab"
    end

    it 'Raises an error if an item not on the menu is chosen' do
      expect{ order.choose_order("chips") }.to raise_error "That dish isn't on the menu"
    end
  end

  describe ' # show_order' do
    it 'gives you a list of all items in the basket' do
      order.choose_order(dish)
      expect { order.show_order }.to output("Burger\n").to_stdout
    end
  end

  describe '# confirm_order' do
    it 'gives you a list of your order and confirms the price' do
      order.choose_order(dish)
      expect{ order.confirm_order }.to output("Your order is as follows:\n" +
            "Burger\n" +
            "In total, your order will cost £2.\n").to_stdout
    end
  end
end
