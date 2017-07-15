require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:items_display) {"Mushrooms: £3\nBroccoli: £2\nBeans: £3\nCanneloni: £5\nSushi roll: £6"}

  it 'initializes with a list of menu items' do
    expect(menu.items).not_to be nil
  end

  it '#display will show the list of dishes and prices' do
    expect{menu.display}.to output.to_stdout
  end
end
