require 'customer_order'

describe CustomerOrder do

  let (:menu) { double :menu}
  it 'responds to add' do
    expect(subject).to respond_to(:add)
  end

  it 'expects order to be an empty array' do
    expect(subject.order).to eq({})
  end

  it 'adds items to array' do
    subject.add("Biltong", 1)
    expect(subject.order).to eq({:Biltong => 1})
  end


end