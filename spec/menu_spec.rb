require 'menu'

describe Menu do

  let(:items) { {
    "Nan" => 2.20,
    "Rice" => 2.70,
    "Aloo Gobi" => 4.10,
    "Sag Paneer" => 4.30,
    "Daal Makhani" => 6.10
  } }

  subject { described_class.new(items) }

  it 'print a list of menu items' do
    expect(subject.print).to eq "Nan: £2.20\nRice: £2.70\nAloo Gobi: £4.10\nSag Paneer: £4.30\nDaal Makhani: £6.10\n"
  end

end
