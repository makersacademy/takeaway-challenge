require 'menu'
describe Menu do
  subject(:menu) {described_class.new}

  it 'displays a menu with a list of dishes with prices' do
    expect(menu.dishes).to eq ({
      :salad => 12,
      :burger => 14,
      :fajitas => 13,
      :pasta => 8,
      :brownies => 9
    })
  end
end
