require 'takeaway'

describe Takeaway do
  it 'shows a menu with prices' do
    expect(subject.menu).to eq ['chips' => 2.00, 'snackbox' => 3.50, 'battered sausage' => 1.50,
      'curry sauce' => 1.00, 'battered cod' => 3.00]
  end

  it 'adds items to an order' do
    subject.order('snackbox', 2)
    expect(subject.order('chips', 2)).to eq ['snackbox', 'snackbox', 'chips', 'chips']
  end

  it 'calculates the cost of an order' do
    subject.order('chips', 2)
    subject.order('battered cod', 1)
    expect(subject.cost_of_order).to eq("£7.00")
  end

  it 'raises an error if cusotmer gives different total' do
    subject.stub(:cost_of_order).and_return("£9")
    expect{subject.pay("£10")}.to raise_error('payment does not reach total')
  end

  it 'confirms payment was successful' do
    subject.stub(:cost_of_order).and_return("£9")
    expect(subject.pay("£9")).to eq("payment processed")
  end

  it 'sends a text' do
    expect(subject).to respond_to(:text)
  end


end
