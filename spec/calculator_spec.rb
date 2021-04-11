require 'calculator'

describe Calculator do
  let(:menu_array)      { [{ dish: 'chiken', price: 5, available?: true },
                           { dish: 'beef', price: 5, available?: false },
                           { dish: 'turkey', price: 10, available?: true }
                          ]
                        }
  let(:menu_dbl)        { double("Menu", menu_list: menu_array) }    
  let(:order_dbl)       { double("Order", basket_item: { dish: 'chiken', price: 5, portions: 2 }) }

  it { is_expected.to be_instance_of(Calculator) }
  it { is_expected.to respond_to(:total) }
  it { is_expected.to respond_to(:add_to_total).with(1).argument }

  it 'changes the total' do
    price = menu_array[0][:price]
    portions = order_dbl.basket_item[:portions]
    expect { subject.add_to_total(order_dbl.basket_item) }.to change { subject.total }.by(price * portions)
  end

  it 'shows the sum of all the orderd items' do
    message = "2x chiken 10 pounds\nTotal = 10 pounds\n"
    basket = [order_dbl.basket_item]
    subject.add_to_total(order_dbl.basket_item)
    expect { subject.summary(basket) }.to output(message).to_stdout
  end
end
