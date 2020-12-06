require 'order'

describe Order do
  let(:order) { Order.new }
  let(:chosen_dish) { "Bangers & Mash" }
  let(:chosen_quantity) { 2 }
  
  it 'allows order to be an instance of the Order class' do
    expect(order).to be_kind_of(Order)
  end

  describe '#see_list' do
    it 'allows order to respond to see_list' do
      expect(order).to respond_to :see_list
    end

    it 'prints name and price' do
      expect(order.see_list).to eq order.menu
    end
  end

  describe '#basket' do
    it 'is empty to begin with' do
      expect(order.basket).to be_empty
    end
  end

  describe '#add_to_basket' do
    it 'allows order to respond to add_to_basket' do
      expect(order).to respond_to(:add_to_basket).with(2).argument
    end

    it 'throws an error if dish unavailable' do
      order.make_unavailable(chosen_dish)
      expect { order.add_to_basket(chosen_dish, 1) }.to raise_error "#{chosen_dish} is not available"
    end

    it 'adds selected dish to the basket' do
      order.add_to_basket(chosen_dish, chosen_quantity)
      expect(order.basket).to include order.selected_dish
    end
  end

  describe '#total' do
    it 'prints total amount due' do
      expect(order).to respond_to :total
    end

    it 'returns the sum of the prices in basket' do
      order.add_to_basket(chosen_dish, chosen_quantity)
      expect(order.total).to eq order.total_price
    end
  end

  describe '#print_summary' do
    it 'prints the order so far' do
      order.add_to_basket(chosen_dish, chosen_quantity)
      expect(order.print_summary).to eq order.basket
    end
  end
end
