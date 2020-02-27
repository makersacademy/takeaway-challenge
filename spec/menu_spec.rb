require 'menu'

describe Menu do
    
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'will respond to the method show_menu' do
    expect(subject).to respond_to(:show_menu)
  end

  it 'will show me a list of dishes with prices, in a pretty way for the user' do
      # Note to self - is there any way to save the output in a variable and then match it in the output?
    expect { subject.show_menu }.to output("Pasta: £9\nPizza: £7\nSteak: £40\nIce Cream: £2\n").to_stdout # so now you can use puts inside of your program as stdout means to puts out to the screen
  end

  it 'will show me a list of dishes with prices, as a hash' do
    expect(subject.show_menu).to eq({
        "Pasta" => 9,
        "Pizza" => 7,
        "Steak" => 40,
        "Ice Cream" => 2
    })
  end

  it 'will respond to a instance_variable_set menu' do
    subject.instance_variable_set(:@menu, { "Burger" => 9 })
    expect { subject.show_menu }.to output("Burger: £9\n").to_stdout 
  end 

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it 'will respond to the method add_to_order' do
    expect(subject).to respond_to(:add_to_order)
  end

  it 'will check that an order history exists' do
    expect(subject.order).to eq []
  end
  it 'will add Pasta to my order' do
    expect(subject.add_to_order("Pasta", 1)).to eq "You have added Pasta to your order"
  end

  it 'will add Pizza to my order' do
    expect(subject.add_to_order("Pizza", 1)).to eq "You have added Pizza to your order"
  end

  it 'will throw an error if I try and add an item that is not on the menu' do
    expect{subject.add_to_order("Sushi", 1)}.to raise_error "That is not on the menu!"
  end

  it 'will be able to handle ordering several dishes' do
    subject.add_to_order("Pizza", 1)
    subject.add_to_order("Pasta", 1)
    expect(subject.order).to eq [{"Pizza" => 7}, {"Pasta" => 9}]
  end

  it 'will be able to handle several orders, at once' do
    subject.add_to_order("Pizza", 2)
    expect(subject.order).to eq [{"Pizza" => 7}, {"Pizza" => 7}]
  end
end

describe Order do

end
