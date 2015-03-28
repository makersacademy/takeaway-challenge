require 'restaurant'

describe Restaurant do

  let(:dominoes) { Restaurant.new }

  it 'has a menu when created' do
    expect(subject).to respond_to :menu
  end

  it 'menu has a list of foods and prices' do
    menu = {1 => ['Margarita:', 5.00], 2 => ['Meat_Feast:', 6.00], 3 => ['Hawaiin:', 5.50],
            4 => ['BBQ_Chicken:', 6.00], 5 => ['Vegetarian:', 5.50], 6 => ['Full_Monty:', 8.00],
            7 => ['Ham_and_Cheese:', 4.00], 8 => ['Pepperoni:', 5.50], 9 => ['Chips:', 3.00]}
    expect(dominoes.menu).to eq menu
  end

  it 'shows the menu to the customer' do
    expect { dominoes.see_menu }.to output.to_stdout
  end


end
