require 'order'


describe Order do

  let(:menu_class) { double "Menu", list: menu} #Menu.list => menu
  let(:menu) do {pizza: 10, burger: 5, coke: 1} end

  let(:order1) { described_class.new({pizza: 2, coke: 1}, menu_class, 21) } #correct payment
  let(:order2) { described_class.new({pizza: 1, burger: 1}, menu_class, 1) } #incorrect payment

  it 'stores dishes and their quantities' do
    expect(order1.meal).to eq( {pizza: 2, coke: 1} )
  end


  context 'correct payment' do
    it 'calculates a total' do
      expect(order1.calculate_total).to eq 21
    end
    it 'calculates a delivery time an hour from now' do
      an_hour_from_now = (Time.new + 3600).strftime("%H:%M")
      expect(order1.delivery_time).to eq an_hour_from_now
    end
    it 'sends a message if order is successful' do
      order1.check_payment
      delivery_time = (Time.new + 3600).strftime("%H:%M")
      expect(order1.send_message).to eq "Thank you! Your order will be delivered before #{delivery_time}"
    end
  end

  context 'incorrect payment' do
    it 'raises an error if the payment does not match the cost' do
      expect{order2.check_payment}.to raise_error("Incorrect payment amount")
    end
  end




end
