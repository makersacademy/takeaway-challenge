require_relative '../lib/menu'

describe Menu do
  let (:menu) { Menu.new }

  it 'creates an empty array' do
    expect(menu.dishes).to be_empty
  end
end
