require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu }

  subject { described_class.new(menu) }

  it 'returns the menu' do
    allow(menu).to receive(:print).and_return Menu::ITEMS
    expect(subject.print_menu).to eq Menu::ITEMS
  end

  # unsure how to test this or whether to test this - it is behaviour of the menu class that I have already tested
  # it 'prints the menu' do
  #     allow(menu).to receive(:print).and_output("Nan: £2.20\nRice: £2.70\nAloo Gobi: £4.10\nSag Paneer: £4.30\nDaal Makhani: £6.10\n").to_stdout
  # end

  it 'allows user to place order' do
    expect(subject.place_order("Nan", 1)).to eq [{ "Nan" => 1 }]
  end

  it 'shows user the price of their order' do
    subject.place_order("Nan", 1)
    allow(menu).to receive(:items).and_return({ "Nan" => 2.2 })
    expect { subject.total_price }.to change { subject.order_price }.by(2.2)
  end
end
