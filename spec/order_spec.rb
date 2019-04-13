require 'order'

describe Order do
  subject(:order) {described_class.new(menu)}
  let(:menu) { double :menu }
  let(:dishes) { { pizza: 10, chips: 5, burger: 8, curry: 5, tofu: 6} }
  let(:selection) { {burger: 2, chips: 2 }}
  #
  # let(:dishes) do
  #   { burger: 2,
  #     chips: 2
  #   }
  # end
  describe '#add order' do
    it '#adds dish and price' do
    order.add_order(:burger, 2)
    order.add_order(:chips, 2)
    expect(order.selection).to eq(selection)
  end
end
end
