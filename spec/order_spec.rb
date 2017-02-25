require 'order'

describe Order do

it { is_expected.to respond_to(:assign_dishes) }

describe '#check_total' do
  it 'should check that bill total is as expected' do
    expect(subject.check_total(["Pizza", "Burger"],13)).to eq(13)
  end

  it 'should check that bill total is not as expected' do
    msg = "Bill total and total don't match"
    expect{subject.check_total(["Pizza", "Burger"],12)}.to raise_error msg
  end

end

describe '#assign_dishes' do
  it 'should check that dishes are assigned to the order' do
  subject.assign_dishes(["Pizza", "Burger"])
  expect(subject.items).to eq (["Pizza", "Burger"])
  end
end


end
