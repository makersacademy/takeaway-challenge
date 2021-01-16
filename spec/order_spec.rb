require 'order'

describe Order do

  subject { described_class.new }

  let(:dishes) { { burger: 2, hamburger: 1,} }

  it 'can order dishes from the menu' do
    subject.add(burger: 2)
    subject.add(hamburger: 1)
    expect(subject.dishes).to eq(dishes)
  end

end
