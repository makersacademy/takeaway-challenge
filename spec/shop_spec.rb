require 'shop'

describe Shop do
  context 'gives information about the menu' do

    it 'returns a menu when asked' do
      expect(subject).to respond_to(:show_menu)
    end

    it 'has items in the menu' do
      expect(subject.menu).not_to be_empty
    end

    it 'shows the menu when asked' do
      expect { subject.show_menu }.to output(String).to_stdout
      subject.show_menu
    end

    it 'has specific items' do
      subject.show_menu
      expect(subject.menu_string).to include("burger")
    end
  end

  context 'creates orders when requested' do
    let(:order) { double('order') }
    it 'creates a new instance of an order' do
      expect(Order).to receive(:new)
      subject.start_order
    end

    it 'adds items to order' do
      allow(order).to receive(:add).with(kind_of(String), kind_of(Integer), kind_of(Integer))
      expect(order).to receive(:add).with("fish", 8, 1)
      subject.add_to_order(order, "fish")
    end
  end

  it 'raises error when ordering something not on the menu' do
    order = double("order")
    expect { subject.add_to_order(order, "prawns") }.to raise_error "sorry we don't sell prawns"
  end

end
