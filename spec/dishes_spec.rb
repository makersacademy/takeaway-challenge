require 'dishes'

describe Dishes do

  subject(:dishes) { described_class.new }

  it 'has a dishes class' do
    expect(dishes).to be_a Dishes
  end


end
