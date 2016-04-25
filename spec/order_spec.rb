require 'order'
require 'money'

describe Order do
  let(:order) { described_class.new }
  let(:dish_spy) { spy(:dish) }
  let(:dish) { double(:dish, name: "Sushi", money: Money.new(620, "GBP")) }

  describe '#add' do
  	it 'adds an order to order hash' do
  		order.add(dish_spy, 3)
  		expect(order.orders).to include dish_spy
  	end

  	it 'updates quantity if dish is already included' do
  		order.add(dish_spy, 3)
  		expect{order.add(dish_spy, 2)}.to change{order.orders[dish_spy]}
  	end
  end

  describe '#summary' do
  	it 'dish receives message #money' do
  		order.add(dish, 2)
  		order.summary
  		expect(dish).to have_received(:money).twice
  	end
	end
end