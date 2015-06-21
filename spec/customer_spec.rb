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

  it 'allows multiple orders of one item, placed at separate times' do
  	subject.add_item(:cheese)
  	subject.add_item(:cheese, 2)
  	expect(subject.order).to eq({cheese: 21})
  end
  

end
