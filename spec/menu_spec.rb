require 'menu'

describe Menu do
  it 'can create a Menu' do
    expect(Menu.new).to be_a_kind_of(Menu)
  end

end
