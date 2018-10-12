require './lib/order.rb'

describe Order do
  subject(:order) { Order.new(menu) }
  let(:menu) { double :menu, :menu => {:STARTERS => {"Onion Bhaji" => 2.95, "Samosa" => 2.95},
  :MAINS => {"Duck Tikka" => 8.95, "Lamb Balti" => 6.95},
  :SIDES => {"Sag Aloo" => 2.95, "Special Fried Rice" => 2.95 }}}

  it 'holds the dishes in a hash' do
    order.dish("Samosa", 2)
    order.dish("Duck Tikka")
    order.dish("Special Fried Rice")
    expect(order.dishes).to eq ([["Samosa", 2.95], ["Samosa", 2.95], ["Duck Tikka", 8.95], ["Special Fried Rice", 2.95]])
  end

  it 'summarises the order' do
    order.dish("Samosa", 3)
    order.dish("Duck Tikka", 4)
    expect { order.summary }.to output("3x Samosa - £8.85\n4x Duck Tikka - £35.80\nOrder Total - £44.65\n").to_stdout
  end

  it 'confirms a dish has been added to the order' do
    expect(order.dish("Sag Aloo")).to eq "1 Sag Aloo has been added to your order"
  end

  it 'can say multiple things have been add to the order' do
    expect(order.dish("Sag Aloo", 10)).to eq "10 Sag Aloo's have been added to your order"
  end
end
