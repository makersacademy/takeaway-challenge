require 'order'

describe Order do

# subject(:order) { described_class.new}

  it {is_expected.to respond_to :list_of_dishes}

  it 'should respond with a hash' do
    expect(subject.list_of_dishes).to include( :pizza => 9 )
  end

  it { is_expected.to respond_to(:order).with(1).argument }


end
