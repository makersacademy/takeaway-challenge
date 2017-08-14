require 'menu'

describe Menu do
  subject { described_class.new({ "pizza" => 1.99, "pasta" => 2.99 }) }

  it 'returns menu via read method' do
    expect(subject.read).to eq({ "pizza" => 1.99, "pasta" => 2.99 })
  end
  it 'uploads new menu' do
    subject.upload({ "garlic bread" => 0.99 })
    expect(subject.read).to eq({ "garlic bread" => 0.99 })
  end

end
