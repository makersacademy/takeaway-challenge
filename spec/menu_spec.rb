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

  it 'checks items are on the menu' do
    expect(subject.on_the_menu?("pizza")).to eq true
  end

  it 'looks up items price' do
    expect(subject.lookup("pizza")).to eq 1.99
  end

end
