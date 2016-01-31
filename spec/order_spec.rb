require 'order'
describe Order do
  let(:dummy_order) {double :dummy_order}
  let(:test_order) {"2 carbonara, 1 tiramisu and I dunno"}
  let(:menu_choice) {{ Mains: 'Price', Margherita: 13, Pasta: 12, Risotto: 11, Calzone: 10, Carbonara: 12, Bolognese: 12, Gnocchi: 11 }}
  subject(:order) {described_class.new test_order, menu_choice}


    it 'returns an array of user input\'s order' do
      expect(order.process_order).to be_a Array
    end

    it 'returns an array of symbols and corresponding numbers' do
      expect(order.process_order).to include [:Carbonara, 2]
    end
end
