require 'order'

describe Order do

  let(:order){ Order.new(menu)}
  let(:menu){double :menu, find_item: {:name => "Chocolate Fudge Cake", :price => 3.75} }

  context 'when taking order' do

    before{allow(menu).to receive(:check_stock).with('Chocolate Fudge Cake'){true}}

    it 'can ask a customer for their order' do
      expect{order.add_dish('Chocolate Fudge Cake')}.to change{order.contents}.to ([{name: 'Chocolate Fudge Cake', price: 3.75}])
    end

    it 'will check to see if stocked' do
      expect(menu).to receive(:find_item).with('Chocolate Fudge Cake')
      order.add_dish('Chocolate Fudge Cake')
    end
  end

  context 'order placed' do

    before{allow(order).to receive(:contents) { [{:name => "Chocolate Fudge Cake", :price => 3.75}, {name: "Lemon Drizzle Cake", price: 3.45}] }}

    it 'can calculate the order total' do
      expect(order.calculate_total).to eq(7.2)
    end
  end
end
