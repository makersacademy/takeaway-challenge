require 'customer'

describe Customer do
  
  subject { Customer.new 075 }

  it 'can request to see a menu' do
    menu = double('menu', menu_items: {'Chicken' => 5.00, "Salted Beef" => 6.50, "Tuna" => 6.00})
    expect(subject.request(menu)).to eq (menu.menu_items)
  end

  it 'can choose items' do
    dbl = double('choices', choices: ['Chicken', 'Tuna'])
    expect(subject.choices=dbl).to eq dbl
  end

  it 'can estimate a total' do
    expect(subject.total_estimate= 11).to eq 11
  end

  it 'can calculate real total' do
    menu = double('menu', menu_items: { 'chicken' => 5.00, 'tuna' => 6.00, 'beef' => 7.00, 'veg' => 6.50 })
    subject.request(menu)
    subject.choices = ['chicken', 'tuna']
    expect(subject.real_total).to eq 11
  end

  it 'can validate the order by checking estimate total vs real total' do
    allow(subject).to receive(:real_total).and_return(11)
    allow(subject).to receive(:total_estimate).and_return(11)
    expect(subject.validate_order?).to be true
  end

  it 'rejects order if estimated total is wrong' do
    allow(subject).to receive(:real_total).and_return(11)
    allow(subject).to receive(:total_estimate).and_return(12)
    expect(subject.validate_order?).to be false
  end

    it 'can create an order if total is correct' do
      allow(subject).to receive(:real_total).and_return(12)
      allow(subject).to receive(:total_estimate).and_return(12)
      subject.validate_order?
      order = double()
      expect(subject.create_order(order)).to eq order
   end

     it 'will be told of error if total is incorrect' do
      allow(subject).to receive(:real_total).and_return(11)
      allow(subject).to receive(:total_estimate).and_return(12)
      subject.validate_order?
      order = double()
      expect{ subject.create_order(order) }.to raise_error "Wrong total"
   end

end

  