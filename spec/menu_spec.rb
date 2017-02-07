require './lib/menu'
require './lib/menuhash'

describe Menu do
  subject(:menu) {described_class.new}

  it 'is created with instance of new class' do
    expect(menu).to be
  end

  it "has text showing available dishes" do
    menu = Menu.new
    menuhash = Foodbuddy.new
    expect(menuhash.list).not_to be_empty
  end

end
