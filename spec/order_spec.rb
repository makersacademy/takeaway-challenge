require 'order'
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe Order do
  # allow subject.send_text == false
  it { is_expected.to respond_to(:check_out) }
  it { is_expected.to respond_to(:place_order) }
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
    expect { subject.add_to_order("Sushi", 1) }.to raise_error "That is not on the menu!"
  end

  it 'will be able to handle ordering several dishes at default quantity' do
    subject.add_to_order("Pizza")
    subject.add_to_order("Pasta")
    expect(subject.order).to eq [{ "Pizza" => 7 }, { "Pasta" => 9 }]
  end

  it 'will be able to handle several orders, at once' do
    subject.add_to_order("Pizza", 2)
    expect(subject.order).to eq [{ "Pizza" => 7 }, { "Pizza" => 7 }]
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'will show me my order, in a pretty format' do
    subject.add_to_order("Pizza")
    expect { subject.show_order }.to output("Pizza: £7\n").to_stdout
  end

  it 'will show me the sum of various dishes in my order' do
    subject.add_to_order("Pizza")
    subject.add_to_order("Pizza")
    expect { subject.total }.to output("Your total is £14").to_stdout
  end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it 'will respond to the method send_message' do
    expect(subject).to respond_to(:send_message)
  end

  it 'will respond to place_order' do
    expect(subject).to respond_to(:place_order)
  end

  it 'will return true if I search for pizza' do
    expect(subject.exists?("Pizza")).to eq true
  end

  it 'will respond to check_out' do
    expect(subject).to respond_to(:check_out)
  end

  it 'will check out my order when I add several items, and show me the order and the total' do
    subject.add_to_order("Pizza")
    subject.add_to_order("Pizza")
    expect { subject.check_out }.to output("Pizza: £7\nPizza: £7\nYour total is £14").to_stdout
  end
  # How do I write doubles for the send_message tests!!!!!!
end
