require 'takeaway'

describe Menu do
  it 'can initialize a constant of menu' do
    menu = Menu.new
  end

  it 'holds a list of available items' do
    menu = Menu.new
    expect(menu.items).to include ("chicken, £5.00")
  end
end
