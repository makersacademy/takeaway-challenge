require 'menu'

describe Menu do
  describe '#view' do
    it 'allows the customer to view a list of available dishes' do
      pizzeria = Menu.new
      expect(pizzeria.view).to eq [{'Peperoni' => 7}, {'Pollo Kiev' => 8}]
    end
  end
end