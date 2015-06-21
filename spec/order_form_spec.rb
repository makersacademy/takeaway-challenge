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
end