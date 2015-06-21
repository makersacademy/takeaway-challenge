require 'order_form'

describe OrderForm do
  
  it { is_expected.to respond_to :show_dishes }
  
  it 'shows dishes' do
    expect(subject.show_dishes).to eq 'Noodles (£3.00), Rice (£2.50)'
  end

  it 'adds dishes to the order' do
    subject.add_dish :Rice, 2
    expect(subject.order.length).to eq 2
  end

  it 'does not add dishes that are not on the menu' do
    expect{ subject.add_dish :Pizza, 1 }.to raise_error 'Not on the menu'
  end

  it 'errors if nothing ordered' do
    expect{ subject.check_total 0 }.to raise_error 'No dishes were selected'
  end

  it 'errors if customer total is incorrect' do
  	subject.add_dish :Rice, 1
    expect{subject.check_total 3}.to raise_error 'Error, total incorrect'
  end

  it 'calculates the total' do
  	subject.add_dish :Noodles, 1
    expect(subject.calculate_total).to eq 3
  end

end