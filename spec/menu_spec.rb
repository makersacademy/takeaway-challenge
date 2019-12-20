require "menu.rb"

describe Menu do
  let (:menu) {Menu.new(dishlist)}
  let (:dishlist) do
    { 
      "Special Fried Rice": 6.50,
      "Shrimp Friend Rice": 6.00,
      "Chicken Balls": 4.00
    }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishlist).to eq(dishlist)
  end

  it 'allows user to see list of dishes and prices' do
  # function of printing dishlist
  end
end