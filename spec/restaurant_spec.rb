require 'restaurant'

describe Restaurant do

  let(:dominoes) { Restaurant.new }

  it 'has a menu when created' do
    expect(dominoes).to respond_to :menu
  end

  it 'has an empty order basket when created' do
    expect(dominoes.basket).to be_empty
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

  xit 'allows you to choose from the menu' do
    dbl= double('user_input')
    expect(dominoes).to receive(:gets).and_return(dbl).twice
    expect(dbl).to receive(:chomp).and_return(:type)
    expect(dbl).to receive(:chomp).and_return(:quantity)
    dominoes.choose
    expect(dominoes.instance_variable_get(:@type)).to eq :type
    expect(dominoes.instance_variable_get(:@quantity)).to eq :quantity
  end

  it 'assigns your choices to an array' do
    dominoes.choose
    expect(dominoes.basket).not_to be_empty
  end

  xit 'allows you to keep choosing until you say 0 entered as a choice' do
  end

  it 'read back the order to the customer with total bill' do
    expect { dominoes.my_order}.to output.to_stdout

  end




end
