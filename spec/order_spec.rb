require 'order'
describe Order do
  let(:dummy_order) {"2 Carbonara, 1 tiramisu and a pasta"}
  let(:menu_choice) {{ Mains: 'Price', Margherita: 13, Pasta: 12, Risotto: 11, Calzone: 10, Carbonara: 12, Bolognese: 12, Gnocchi: 11 }}
  subject(:order) {described_class.new dummy_order, menu_choice}


    it 'returns an array of user input\'s order' do
      expect(order.process_order).to be_a Array
    end

    it 'returns an array of symbols' do
      menu.take_order
      expect(menu.selection[random_sampler]).to be_a Symbol
    end
end
