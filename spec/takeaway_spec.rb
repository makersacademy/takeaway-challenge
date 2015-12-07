require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu_klass: menu,
    send_text_klass: sender) }
  let(:menu) { double :menu }
  let(:sender) {double :send_text}
  let(:rand_num) { rand(1..9) }
  let(:customer) {{"+44712345": :Chris}}

  context 'when selecting an order' do
    it 'returns number of choices' do
      5.times {|enum| takeaway.select_order(enum, rand_num)}
      expect(takeaway.complete_order.size).to eq 5
    end

    it 'returns number of dishes' do
      5.times {|enum| takeaway.select_order(enum, 4)}
      expect(takeaway.total_of_dishes).to eq 20
    end
  end

  context 'when finalising order' do
    xit 'returns total price' do
      takeaway.select_order(:Lamb_curry, 2)
      takeaway.select_order(:Prawn_curry, 3)
      expect(takeaway.total_price).to eq 23
    end
  end

  it 'sends a text message' do
    allow(sender).to receive(:confirmation_text).and_return(customer)
    expect(takeaway.text_confirmation).to eq(customer)
  end
end
