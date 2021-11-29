require 'order'

describe Order do

  it 'should let us view our basket' do
    subject.choose_dish("pizza", 4)
    expect(subject.view_basket).to eq :pizza => [10,4]
  end

  it 'should raise an error when calculating the total if our basket is empty' do
    expect { subject.calculate_total }.to raise_error 'you have not ordered anything'
  end

  it 'correctly calculates our total' do
    subject.choose_dish("burger", 4)
    subject.choose_dish("pizza", 4)
    expect(subject.calculate_total).to eq 68
  end
  

end
