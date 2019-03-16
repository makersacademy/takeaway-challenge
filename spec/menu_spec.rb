require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new }

  it 'responds to #show_dishes' do
    expect(menu).to respond_to(:show_dishes)
  end

  it 'shows a list of dishes with prices' do
    expect(menu.show_dishes).to eq({dish1: 10, dish2: 11})
  end

end