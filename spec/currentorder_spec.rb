require 'currentorder'

describe CurrentOrder do
  subject(:currentorder){described_class.new}
  let(:order){double:order}

  describe '#new_item' do
    it 'stores items ordered' do
      currentorder.new_item(order)
      expect(currentorder.current_order).to eq order
    end
  end

  # describe '#order_review' do
  #   it 'returns a list of whats been ordered' do
  #     expect(currentorder.order_review).to return
  #   end
  # end

end
