require 'order'

describe 'Order' do

  subject(:order) { Order.new }
  let(:menu) { double :menu }

  describe '#initialize' do
    it 'should have an empty order list' do
      expect(order.list).to be_empty
    end

    it 'should have a menu' do
      expect(order.menu).not_to be(nil)
    end

  end

  describe '#read_menu' do
    it 'displays the menu' do
      expect{order.read_menu}.to output.to_stdout
    end
  end

  describe '#choose' do
    it 'allows customer to choose items and add to list' do
       order.choose("Margherita")
       expect(order.list).to include("Margherita" => 6)
     end
  end

  describe '#total' do
    it 'calculates the total cost' do
      order.choose("Margherita")
      order.total
      expect(order.total_cost).to eq 6
    end
  end

end
