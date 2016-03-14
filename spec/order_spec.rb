require './docs/order.rb'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double(:dish, quantity: 1, price: 10) }

  describe 'make a new order' do
    it 'should create an empty array when initialized' do
      expect(order.view).to be_an(Array)
    end

    it 'should allow users to add dishes to order' do
      expect(order).to respond_to(:add).with(2).arguments
    end

    it 'should push dishes to final order' do
      expect{ order.add(dish, 1) }.to change{ order.view.count }.by(1)
    end
  end

  describe 'order review' do

    # it 'should finish the order' do
    #   message = "Thanks for ordering with us!"
    #   expect(order.finish).to eq message
    # end
    it 'should return sum of all dish prices in order' do
      5.times { order.add(dish, 1) }
      expect(order.total).to eq 50
    end
  end

end
