require 'menu'

describe Menu do
  let(:test_menu) do
    { green_curry: 13.99,
      red_curry: 12.99,
      korma_chicken: 14.55 }
  end

  it 'accepts a list of dishes hash when initialized' do
    expect(described_class).to receive(:new).with(instance_of(Hash))
    described_class.new(test_menu)
  end

  it 'returns a list of dishes with prices' do
    menu = described_class.new(test_menu)
    expect(menu.list).to eq test_menu
  end

  it 'raises error when initialized incorrectly' do
    expect do
      subject
    end.to raise_error 'Invalid Input, Try Initializing Menu with Hash'
  end
end
