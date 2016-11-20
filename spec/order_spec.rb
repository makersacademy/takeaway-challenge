require 'order'


describe Order do

  let(:menu) {double :menu}
  let(:order1) { described_class.new( menu, [ { "Diavola" => 1, "Capricosa" => 2 }, 27.45 ] ) }

  it 'stores dishes and their quantities' do
    expect(order1.meal).to eq( { "Diavola" => 1, "Capricosa" => 2 }  )
  end

  it 'stores the customer payment' do
    expect(order1.payment).to eq 27.45
  end

  # it 'calculates a total' do
  #   expect(order1.calculate_total).to eq 27.45
  # end


end
