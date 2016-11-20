require 'order'


describe Order do

  let(:menu1) {double :menu1}
  let(:order1) { described_class.new( menu1, [ { "Diavola" => 1, "Capricosa" => 2 }, 27.45 ] ) }
  let(:order2) { described_class.new( menu1, [ { "Diavola" => 1, "Capricosa" => 2 }, 25.00 ] ) }

  it 'stores dishes and their quantities' do
    expect(order1.meal).to eq( { "Diavola" => 1, "Capricosa" => 2 }  )
  end

  it 'stores the customer payment' do
    expect(order1.payment).to eq 27.45
  end

  context 'correct payment' do
    before do
      allow(order1).to receive(:menu).and_return({ "Diavola" => 8.95, "Capricosa" => 9.25 })
    end
    it 'calculates a total' do
      expect(order1.calculate_total).to eq 27.45
    end
    it 'calculates a delivery time an hour from now' do
      expect(order1.delivery_time).to eq (Time.new + 360).strftime("%H:%M")
    end
    # it 'sends a message if order is successful' do
    #   order1.check_payment
    #   delivery_time = (Time.new + 360).strftime("%H:%M")
    #   expect(order1.send_message).to eq "Thank you! Your order will be delivered before #{delivery_time}"
    # end
  end

  context 'incorrect payment' do
    before do
      allow(order2).to receive(:menu).and_return({ "Diavola" => 8.95, "Capricosa" => 9.25 })
    end
    it 'raises an error if the payment does not match the cost' do
      expect{order2.check_payment}.to raise_error("Incorrect payment amount")
    end
  end




end
