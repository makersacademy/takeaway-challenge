require 'menu'

describe Menu do

  it 'can display a list of items' do
    expect(Menu.read).to include({ "chips" => 1.00 })
  end

end
