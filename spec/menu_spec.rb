require 'menu'

describe Menu do
  it 'returns a list of menu items' do
    expect(subject.dishes).to eq "Spare Ribs" => 6.00, "Seaweed" => 4.50, "Half Duck" => 20.00

  end
end
