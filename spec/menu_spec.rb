require 'menu'

describe Menu do
  let(:order) { double :order, add: nil }
  let(:test_menu) do
    { green_curry: 13.99,
      red_curry: 12.99,
      korma_chicken: 14.55 }
  end

  # before :each do
  #   menu = described_class.new(test_menu)
  # end

  it 'accepts a list of dishes hash when initialized' do
    expect(described_class).to receive(:new).with(instance_of(Hash))
    described_class.new(test_menu)
  end

  it 'returns a list of dishes with prices' do
    menu = described_class.new(test_menu)
    expect(menu.list).to eq test_menu
  end

  it 'add selected items to the order' do
    menu = described_class.new(test_menu)
    expect(order).to receive(:add).with(:green_curry)
    menu.add_to_order(:green_curry, order)
  end

  it 'raises error when initialized incorrectly' do
    expect do
      subject
    end.to raise_error 'Invalid Input, Try Initializing Menu with Hash'
  end

  it 'raises error if item does not exist in the menu' do
    menu = described_class.new(test_menu)
    expect do
      menu.add_to_order(:dodgy_food, order)
    end.to raise_error 'Invalid Dish, Available Dishes in the Menu'
  end
end
