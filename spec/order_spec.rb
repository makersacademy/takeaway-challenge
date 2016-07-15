require 'order'

describe Order do
  menu = [{:id => 1, :dish => "Chicken Tikka", :price => 6.95},
          {:id => 2, :dish => "Butter Chiken", :price => 6.45},
          {:id => 3, :dish => "Paneer Tikka", :price => 8.45}]

  subject(:order) { described_class.new(menu: menu) }

describe '#show_menu' do
  it 'shows a list of dishes available with prices' do
    allow(order).to receive(:show_menu) { menu }
    expect(order.show_menu).to eq menu
  end
end

  describe '#select_dishes' do
    it 'allow to select any number of several dishes' do
      expect{ order.select_dishes(id: 1, quantity: 3) }.not_to raise_error
    end
  end

  describe '#confirm_total' do
    it 'matches the sum for various dishes in order' do
      order.select_dishes(id: 1, quantity: 3)
      expect(order.confirm_total(total_amount: 20.85)).to eq 20.85
    end
  end
end
