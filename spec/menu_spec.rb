require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'shows a list of dishes' do
    expect(menu.view_dishes).to eq({})
  end

end
