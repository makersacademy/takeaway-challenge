require 'orderlist'

describe OrderList do
  let(:orderlist) { described_class.new }

  context '#show_order' do
    it 'shows the current order list' do
      expect(orderlist.show_list).to be_an_instance_of(Array)
    end
  end

end
