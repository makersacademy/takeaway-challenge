require 'menu'

describe Menu do
  it 'customer can see a list of dishes with prices' do
    menu = Menu.new
    
    expect(menu.print_menu).to eq({
        "jollof rice": { price: 6 },
        "fried plantain": { price: 3 },
        "jerk chicken": { price: 8 },
        "vegetable patty": { price: 4.5 },
        "ice cream": { price: 4 }
      })
  end
end
