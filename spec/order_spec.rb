require 'order'

describe Order do

  context '#stores order' do
    it 'stores order into hash' do
      order = Order.new
      expect{order.add("Cake, 3")}.to change { order.list.count }.by 1
    end
  end

end
