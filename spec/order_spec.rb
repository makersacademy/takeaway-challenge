require 'order.rb'

describe Order do
  
  it 'initializes with an empty order' do
    expect(subject.order_placed).to eq [] 
  end
  
  it 'adds available dishes to order' do
    # need to input a double here so test is unaffected by menu class
    subject.add("sandwhich")
    expect(subject.order_placed[0]).to eq("sandwhich")
  end

  it 'checks if requested item is on menu' do
    # need to input a double here so test is unaffected by menu class
    expect(subject.check_menu("sandwhich")).to eq true
  end

  it 'raises error if requested item is not available on menu' do
    # need to input a double here so test is unaffected by menu class
    expect { subject.add("not on menu") }.to raise_error("That item is not available")
  end

end
