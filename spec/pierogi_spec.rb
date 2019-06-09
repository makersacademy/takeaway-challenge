require 'pierogi'

describe Pierogi do
  it 'is initialized with a full pierogi menu' do
    pierogi = Pierogi.new
    expect(pierogi).to have_attributes(:menu => {"small pierogi" => 1, "large pierogi" => 3, "supersize pierogi" => 4,
      "meat pierogi" => 4, "chocolate pierogi" => 2, "honey pierogi" => 2} )
  end

  it 'can have items added to menu' do
    pierogi = Pierogi.new
    expect(pierogi.add_to_menu("menu", 1)).to be_nil
  end

  it 'raises error if menu item has no price' do
    pierogi = Pierogi.new
    expect{ pierogi.add_to_menu("small pierogi", "large pierogi") }.to raise_error(RuntimeError, "Price must be a number")
  end
  
  it 'displays days menus' do
    pierogi = Pierogi.new
    formatted_menu = "small pierogi for 1\nlarge pierogi for 3\nsupersize pierogi for 4\nmeat pierogi for 4\nchocolate pierogi for 2\nhoney pierogi for 2"
    expect(pierogi.show_food).to eq(formatted_menu)
  end
end