require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'has an Italian menu present' do
    expect(menu.italian_menu).to eq({:pasta => 10,
      :pizza => 15,
      :risotto => 20})
  end
end
