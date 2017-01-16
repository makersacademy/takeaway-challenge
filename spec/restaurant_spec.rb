require 'restaurant'

describe Restaurant do
  subject(:restaurant){Restaurant.new}
  it { is_expected.to respond_to(:twiliohelper) }
  let(:twiliohelper) { double(:twiliohelper)}
  let(:dish_carbonara) { double(:dish, :name => "Linguine alla carbonara col tartufo", :price => 15) }
  let(:dish_lasagna) { double(:dish, :name => "Lasagne in bianco broccoli e salsiccia", :price => 12) }
  let(:order) { double(:order, :dishes => [])}

  describe '#confirm' do
    it 'triggers the confirmation process' do
      order.dishes << {dish: dish_carbonara, quantity: 2}
      order.dishes << {dish: dish_lasagna, quantity: 1}
      restaurant.twiliohelper = twiliohelper
      expect(twiliohelper).to receive :send
      expect{restaurant.confirm(order.dishes,42)}.not_to raise_error
      expect{restaurant.confirm(order.dishes,30)}.to raise_error 'Cannot place order: total is wrong'
    end
  end
end
