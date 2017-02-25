require 'order'

describe Order do
  subject(:order) {described_class.new}

  let(:make_order) do
    { vegetable_spring_roll: 4.80}
  end

  it 'customer can make an order' do
   expect(subject.make_order) to eq (make_order)
  end

end


#
# I would like to be able to select some number of several available dishes
