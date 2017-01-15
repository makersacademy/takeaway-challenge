require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:dish_carbonara) { double(:dish, :name => "Linguine alla carbonara col tartufo", :price => 15) }
  let(:dish_lasagna) { double(:dish, :name => "Lasagne in bianco broccoli e salsiccia", :price => 12) }
  let(:twiliohelper) { double(:twiliohelper)}

  describe '#dishes' do
    it 'stores selected dishes' do
      expect{order.dishes << {dish: dish_carbonara, quantity: 2}}.not_to raise_error
      expect{order.dishes << {dish: dish_lasagna, quantity: 1}}.not_to raise_error
    end
  end

  describe '#total' do
    it 'calculate and return the total of the order' do
      order.dishes << {dish: dish_carbonara, quantity: 2}
      order.dishes << {dish: dish_lasagna, quantity: 1}
      expect(order.total).to eq 42
    end
  end
  #
  # describe '#confirm' do
  #   it 'triggers the confirmation process' do
  #     order.dishes << {dish: dish_carbonara, quantity: 2}
  #     order.dishes << {dish: dish_lasagna, quantity: 1}
  #     order.twiliohelper = twiliohelper
  #     allow(twiliohelper).to receive(:send){"Thank you! Your order was placed and will be delivered before #{(Time.new + 60*60).strftime("%H:%M")}"}
  #     expect(order.confirm).to eq "Thank you! Your order was placed and will be delivered before #{(Time.new + 60*60).strftime("%H:%M")}"
  #   end
  # end
end
