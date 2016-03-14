require 'order'

describe Order do
  subject(:order) { described_class.new(menu: menu) }
  let(:menu) { double(:Menu, dishes: [dish1, dish2, dish3]) }
  let(:dish1) { double(:Dish, name: "Chicken", price: 1) }
  let(:dish2) { double(:Dish, name: "Fish", price: 2) }
  let(:dish3) { double(:Dish, name: "Steak", price: 3) }
  let(:dish1_index) { menu.dishes.index(dish1) }

  describe '#from_menu' do
    it 'displays the menu for selection' do
      expect(menu).to receive(:display)
      order.from_menu
    end
  end

  describe '#add' do
    it 'gets the dish from the menu' do
      expect(menu).to receive(:dishes)
      order.add dish1_index
    end

    it 'adds a meal to the order' do
      expect{ order.add dish1_index }.to change {
        order.summary }.to include dish1.name
    end
  end

  describe '#summary' do
    it 'shows a summary of order' do
      expect{ order.add dish1_index }.to change {
        order.summary }.to include dish1.name
    end
  end

  describe '#submit' do
    it 'submit correct final order' do
      next_hour = "#{(Time.now + 3600).hour}:#{Time.now.min}"
      message = "Thank you! Your order was placed "
      message += "and will be delivered before #{next_hour}"
      expect(order.submit).to include message
    end

    it 'submitting an incorrect final order errors' do
      message = "There is a discrepency with your order!"
      expect{ order.submit({dish1 => 1}, 2) }.to raise_error message
    end
  end
end
