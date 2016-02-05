require 'restaurant'

describe Restaurant do

  let(:menu) {double :menu, list_items: {orange: 1, noodles: 10, pie: 6}}
  let(:sms) {double :sms, send_sms: "message"}

  subject(:restaurant) {described_class.new(menu, sms)}

  context 'menu management' do
    describe '#menu' do
      it 'calls menu instance list' do
        allow(menu).to receive(:list_items) {{}}
        expect(restaurant.menu).to eq ({})
      end
    end
  end

  context 'order management' do

    let(:customer) {double :customer, name: "Rufus", tel_no: "1-800-EXAMPLE"}
    let(:customer2) {double :customer, name: "Ben"}

    before do
      restaurant.place_order(customer, [:orange, :pie], 7)
    end

    describe '#verify_order' do
      it 'throws an error when order doesn\'t match menu' do
        expect{restaurant.place_order(customer, [:haggis, :dog], 12)}.to raise_error "Invalid order"
      end
    end

    describe '#verify_bill' do
      it 'throws an error when bill is wrong' do
        expect{restaurant.place_order(customer, [:orange, :pie], 8)}.to raise_error "Incorrect payment"
      end
    end
  end

end
