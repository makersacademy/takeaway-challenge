require 'order'

describe Order do

  let(:selected_dishes) { "chips" }

  it 'expected to have one argument when created' do
    expect(Order).to respond_to(:new).with(1).argument
  end

  context '#view_order' do
    it 'responds to view_order' do
      subject = Order.new(selected_dishes)
      expect(subject.view_order).to eq(selected_dishes)
    end
  end
end

