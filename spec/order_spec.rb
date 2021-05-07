require 'order'

describe Order do
  describe 'menu' do
    it 'prints the list of dishes from the menu' do 
      order = Order.new
      expect(order.menu).to eq(true)
    end
  end


end 