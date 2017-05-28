require 'takeaway'

describe Takeaway do
subject(:takeaway) { described_class.new }
# let(:restaurant){double(:restaurant, menu: { kimchi_pancake: 2,
#                                              prawn_pancake: 4 } )

  it 'is created with empty order' do
    expect(takeaway.order).to eq new_order
  end
  #
  # describe '#view_menu' do
  #   before do
  #    allow(restaurant).to receive(:view).and_return {menu}
  #  end
  #  it 'displays the restaurant menu' do
  #     expect(takeaway.view_menu).to eq restaurant.menu
  #  end
  # end

# describe '#add_item' do
#   it 'adds item to order hash' do
#   subject.add_item('bulgogi', 2)
#   expect(subject.order).to include(:bulgogi => 2.0)
#   end
# end
end
