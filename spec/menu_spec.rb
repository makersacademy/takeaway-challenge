require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'list should contain items and prices' do
    expect(menu.list).to_not be_nil
  end
  it '#show_list should display list' do
    expect{menu.show_list}.to output.to_stdout
  end
  it 'raises error if not included in list' do
    item = "example".to_sym.capitalize
    expect{menu.on_menu?(item)}.to raise_error("Not on the menu")
  end
end
