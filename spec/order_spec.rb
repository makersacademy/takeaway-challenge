require './lib/order'

describe Order do
  let(:menu_klass1) {Menu}
  subject {Order.new menu1, menu_klass1}
  let(:menu1) {double(:menu1)}
  let(:dish1) {double(:dish1)}
  let(:dish2) {double(:dish2)}
  let(:value1) {double(:value1)}
  let(:value2) {double(:value2)}

before(:each) do
  allow(menu1).to receive(:read).with(1).and_return(dish1)
  allow(menu1).to receive(:read).with(2).and_return(dish2)
  allow(dish1).to receive(:price).and_return(4.99)
  allow(dish2).to receive(:price).and_return(1.99)
end

  it '#initializes using a menu class' do
    expect(subject.menu_klass).to eq menu_klass1
  end
  it '#initializes using a menu' do
    expect(subject.menu).to eq menu1
  end

  context 'when making an order' do
    it '#add dish to order' do
      subject.pick_menu_item(1)
      expect(subject.order.last).to eq dish1
    end
    it '#add 2 dishes to order' do
      subject.pick_menu_item(1)
      subject.pick_menu_item(2)
      expect(subject.order.last).to eq dish2
    end
    it '#total order' do
      subject.pick_menu_item(1)
      subject.pick_menu_item(2)
      expect(subject.total).to eq 6.98
    end
    it '#add more than 1 item' do
      subject.pick_menu_item(1,2)
      expect(subject.order[-2]).to eq dish1
    end
  end

end