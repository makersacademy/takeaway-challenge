require 'order'

describe Order do
  subject(:order) { described_class.new }
  # let(:dish) { double("dish double", :name => "Lasagna", :price => 8)}
  let(:dish) { Dish.new("Lasagna", 8) }

  it "has an empty order list in the beginning" do
    expect(order.order_list).to be_empty
  end

  describe '#add_order' do
    it 'should add dishes to the order list' do
      order.add_order("Lasagna", 1)
      expect(order.order_list.last.name).to eq("Lasagna")
    end

    it 'should add 2 same dishes at once' do
      expect { order.add_order("Lasagna", 2) }.to change { order.order_list.length }.by(2)
    end
  end

  describe '#print_order' do
    it 'should print order' do
      order.add_order("Lasagna", 2)
      expect(order.print_order).to eq("2 X Lasagna")
    end
  end
end

