require 'order'


describe Order do

  let(:order1) { described_class.new( [ { "Diavola" => 1, "Capricosa" => 2 }, 27.45 ] ) }

  it 'stores dishes and their quantities' do
    expect(order1.meal).to eq( { "Diavola" => 1, "Capricosa" => 2 }  )
  end

  it 'stores the customer payment' do
    expect(order1.payment).to eq 27.45
  end



end
