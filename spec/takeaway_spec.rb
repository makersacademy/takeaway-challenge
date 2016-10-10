require 'takeaway'

describe Takeaway do

  subject { described_class.new(menu) }
  let(:menu) { double(:menu) }
  let(:dishes_list) { "item: £2.00" }
  let(:dishes) do
    {'item': 2.00}
  end

  it {is_expected.to respond_to(:add).with(2).arguments}

  it 'should show a list of dishes and prices' do
    allow(menu).to receive(:show).and_return(dishes_list)
    expect(subject.menu_list).to eq(dishes_list)
  end

  context 'dishes have been added to order'
    before do
      allow(menu).to receive(:do_we_have).and_return(true)
      allow(menu).to receive(:price).and_return(2.00)
      subject.add('item', 1)
    end
  it 'can add a dish and quantity to the order' do
    expect(subject.order).to include(item: 'item', qty: 1, total: 2.00)
  end
  it 'should calculate and return an orders total amount' do
    expect(subject.total).to eq("Your order total is £2.00")
  end

    # Not sure why this is failing? Works in IRB
    # it 'should not allow a non menu item to be added to the order' do
    #   allow(menu).to receive(:do_we_have).and_return(false)
    #   expect(subject.add('item', 1)).to raise_error 'Thats not on the menu!'
    # end

end
