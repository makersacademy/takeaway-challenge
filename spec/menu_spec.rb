require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new }

  it 'responds to #show_dishes' do
    expect(menu).to respond_to(:show_dishes)
  end

  it 'shows a list of dishes with prices' do
    expect(menu.show_dishes).to eq({dish1: 10, dish2: 11})
  end

  it 'selects several dishes' do
    expect(menu).to respond_to(:select_dishes).with(1..10).arguments
  end

  it 'selectes the only 2 available dishes' do
    menu.select_dishes('dish1','dish2','dish3')
    expect(menu.show_selected_dishes).to eq(['dish1','dish2'])
  end
end