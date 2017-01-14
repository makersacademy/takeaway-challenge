require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let (:dish) { double :dish }

  it 'contains a menu of dishes' do
    menu.menu << dish
    expect(menu.menu).to include dish
  end

end
