require "menu.rb"

describe Menu do
  let(:menu) { Menu.new(dishlist) }
  let(:dishlist) do
    { 
      "Special Fried Rice": 6.50,
      "Shrimp Fried Rice": 6.00
    }
  end
  let (:printed_menu) { "Special Fried Rice £6.50, Shrimp Fried Rice £6.00" }
  
  it 'creates instance of class' do
    expect(menu).to be_a(Menu)
  end
  
  it 'has a list of dishes and prices' do
    expect(menu.dishlist).to eq(dishlist)
  end

  it 'allows user to see list of dishes and prices' do
    expect(menu.prints).to eq(printed_menu)
    # print = priv method, prints ?
  end
end
