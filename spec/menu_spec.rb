require 'menu'

describe Menu do

  it 'can return a list of the menu items with their prices.' do
    expect(subject.list).to eq(["burger: 5.50", "chips: 1.50"])
  end

end
