require 'order'


describe Order do

  let(:new_order) {described_class.new({ "Diavola" => 1, "Capricosa" => 2 })}

  it 'stores dishes and their quantities' do
    expect(new_order.meal).to eq({ "Diavola" => 1, "Capricosa" => 2 })
  end


end
