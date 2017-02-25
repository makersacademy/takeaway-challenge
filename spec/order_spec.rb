require 'order'

describe Order do

it { is_expected.to respond_to(:assign_dishes) }

describe '#check_total' do
  it 'should check that bill total is as expected' do
    expect(subject.check_total(["Pizza", "Burger"],13)).to eq(13)
  end
end

end
