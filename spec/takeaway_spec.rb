require 'takeaway'

RSpec.describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { { "DAIFUKU" => 2, "ICHIGO" => 3 } }
  let(:order) { [{ dish: "DAIFUKU", qty: 1 }, { dish: "ICHIGO", qty: 2 }] }
  let(:mochi_list) { ["DAIFUKU, £2", "ICHIGO, £3"] }

  it 'list dishes with their price' do
    allow(menu).to receive(:print_menu).and_return(mochi_list)

    expect(takeaway.show_menu).to eq(mochi_list)
  end

  it 'summarise the total price' do
    allow(menu).to receive(:dishes).and_return(menu)

    expect(takeaway.order_summary(order)).to eq(8)
  end

end
