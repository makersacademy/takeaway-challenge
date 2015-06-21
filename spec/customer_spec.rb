require 'customer'

describe Customer do

  let(:menu) {double :menu, show_menu:{cheese: 7,
                                       barbeque: 8,
                                       spicy: 9,
                                       meaty: 11,
                                       vegetarian: 6,
                                       hawaiian: 8} }

  subject {Customer.new(menu)}

  it 'allows a customer to check the menu' do
    expect(subject.menu[:cheese]).to eq 7
  end

  it 'allows an item to be added to the order' do
    subject.add_item(:spicy)
    expect(subject.order).to eq({spicy: 9})
  end

  it 'allows more than one of an item to be added to the order' do
    subject.add_item(:meaty,2)
    expect(subject.order).to eq({meaty: 22})
  end

  it 'allows multiple orders of one item, placed separately' do
    subject.add_item(:cheese,2)
    subject.add_item(:cheese, 1)
    expect(subject.order).to eq({cheese: 21})
  end

  it 'allows an item to be removed from the order' do
    subject.add_item(:spicy)
    subject.remove_item(:spicy)
    expect(subject.order.length).to eq 0
  end

  it 'allows multiple items to be removed from the order at once' do
  	subject.add_item(:hawaiian,4)
  	subject.remove_item(:hawaiian,2)
  	expect(subject.order).to eq({hawaiian: 16})
  end

  it 'removes an item from the order when the quantity is 0' do
  	subject.add_item(:cheese,3)
  	subject.remove_item(:cheese, 3) 
  	expect(subject.order.length).to eq 0
  end

  it 'can display the total price of the order' do
  	subject.add_item(:cheese,2)
  	subject.add_item(:spicy,3)
  	expect(subject.total_price).to eq 41
  end

  it 'calculates total price correctly when called multiple times' do
  	subject.add_item(:cheese,2)
  	subject.total_price
  	subject.add_item(:barbeque)
  	expect(subject.total_price).to eq 22
  end

  it 'doesn\'t allow decimal number for quantity of order' do
  	expect{subject.add_item(:cheese,1.4)}.to raise_error 'invalid number'
  end



end
