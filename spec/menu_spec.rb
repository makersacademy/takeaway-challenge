require 'menu'

describe Menu do

  subject(:menu) { described_class.new}

  it 'lists dishes with prices' do
    expect(menu.list_dishes).to eq({})
  end

end
