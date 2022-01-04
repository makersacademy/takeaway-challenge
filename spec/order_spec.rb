require 'order'
describe Order do
    let(:hamburger) {double(name: 'Hamburger', price: 5)}
    let(:chips) {double(name: 'Chips', price: 2)}

    it {is_expected.to respond_to(:add, :total_price, :print_order, :place_order)}

    it 'starts with empty order list' do
        expect(subject.order_list).to be_empty
    end

    it 'add dishes to the order list' do
        subject.add(hamburger)
        subject.add(chips, 2)
        expect(subject.order_list).to include({hamburger => 1}, {chips => 2})
    end

    it 'can return the total price of the order' do
        subject.add(hamburger)
        subject.add(chips, 2)
        expect(subject.total_price).to eq 9
    end

    it 'print order summary' do
        subject.add(hamburger)
        subject.add(chips, 2)
        expect(subject.print_order).to eq "Hamburger: 5 * 1 = 5, Chips: 2 * 2 = 4"
    end
end