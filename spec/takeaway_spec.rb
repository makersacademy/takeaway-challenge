require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:list){double :list, dish_list: ({dish => price})}
  let(:dish) {double :dish}
  let(:price) {double :price}


  describe '#show_list' do
    it 'should show a list of dishes' do
    #  expect(takeaway).to respond_to(:show_list).with(1).argument
    expect(takeaway.show_list(list)).to eq list.dish_list
    end
  end

end
