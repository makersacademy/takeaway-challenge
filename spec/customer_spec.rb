require 'customer'

describe Customer do

  it 'expects customer to respond to select_dishes' do
    expect(subject).to respond_to(:select_dishes)
  end

  it 'expects customer to respond to total_cost' do
    expect(subject).to respond_to(:total_cost)
  end

  it 'expects customer to respond to pay' do
    expect(subject).to respond_to(:pay)
  end

  it 'expects customer to respond to total_cost' do
    expect(subject).to respond_to(:total_order)
  end

  it 'expects order to be updated when dishes are chosen' do
    subject.select_dishes('hamburger', 3)
    expect(subject.order).to include('hamburger')
  end

  it 'expects menu to be displayed' do
    expect(subject.see_menu).to eq('hamburger' => 2, 'pizza' => 5)
  end

  it 'raises an error if selection is not on the menu' do
    expect{subject.select_dishes('noodles', 4)}.to raise_error('This dish is not on our menu')
  end

  it 'expects total_cost to correctly add up the total cost' do
    subject.select_dishes('hamburger', 7)
    expect(subject.total_cost).to eq("£14")
  end

  it 'expects an error message if the total cost is incorrect when paying' do
    subject.select_dishes('hamburger', 7)
    expect{subject.pay(10)}.to raise_error("The amount given does not equal the total cost")
  end

end
