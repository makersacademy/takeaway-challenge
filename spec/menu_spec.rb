require 'menu'

describe Menu do
  it {is_expected.to respond_to(:print_dishes) }
  it 'Has a hash of dishes' do
    expect(subject.menu).to be_instance_of(Hash)
  end

  describe '#print_dishes' do
    it 'prints a list of dishes and prices' do
      testmenu = Menu.new({salmon: 10})
      expect{ testmenu.print_dishes }.to output("Our tasty menu:\nSalmon : £10.00\n").to_stdout
    end
  end

  describe '#select_dishes' do
    it { is_expected.to respond_to(:select_dishes).with(2).arguments }

    it 'returns an order object when selected' do
      allow(Order).to receive(:new).and_return('foo')
      expect(subject.select_dishes('food', 2)).to eq('foo')
    end
  end

end