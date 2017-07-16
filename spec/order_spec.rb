require 'order'

describe Order do

  let(:new_order) {described_class.new({ "Pie n Mash" => 2 })}

  it "stores amount of dishes" do
    expect(new_order.dish).to eq({ "Pie n Mash" => 2})
  end









end
