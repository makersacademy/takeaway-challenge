require 'order'

describe Order do

  describe '#your_order' do
    it 'should allow user to select a dish' do
      menu = Menu.new
      expect(subject.my_order(1)[0]).to eq menu.pizzas.values[0]
    end
  end

end
