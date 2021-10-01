require './lib/order'

describe Order do
  describe '#add_menu' do
    it 'adds a menu' do
      order = Order.new
      expect(order.menu).to eq 
      (
        {
        "Chicken Korma"=>8.99,
        "Pilau Rice"=>2.99,
        "Peshwari Naan"=>1.99,
        "4 Poppadoms"=>1.99,
        "Stella Artois"=>3.99
        }
      )
    end
  end
end
  # describe '#initialize' do
  #   it 'displays a menu' do
  #     order = Order.new
  #     m1 = double('menu')
  #     allow(m1).to receive(:contents) { 
  #       {"Chicken Korma"=>8.99,
  #        "Pilau Rice"=>2.99,
  #         "Peshwari Naan"=>1.99,
  #          "4 Poppadoms"=>1.99,
  #           "Stella Artois"=>3.99}
  #          }
  #     expect(order.menu).to eq (m1) 
  #   end
  # end