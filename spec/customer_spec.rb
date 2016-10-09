require 'customer'

describe Customer do

  subject(:customer) { described_class.new }
  let(:selection) { double (:selection) }

  describe 'initialization' do
    it 'will have no order stored' do
      expect(subject.pending_order).to be_empty
    end
  end

  it 'will allow customer to add selection to their order' do
    subject.select_dish
    selection = 1
    expect(subject.confirm_order).to eq order
  end

end
