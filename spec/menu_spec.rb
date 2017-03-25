require './lib/menu'

describe Menu do

  let(:menu) {described_class.new}
  let(:curry) {double :dish}

  it 'prints a list of dishes on the menu and their price' do
    menu.add(curry)
    expect(menu.list).to include (curry)
  end

end
