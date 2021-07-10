require 'menu'

describe Menu do
  it { is_expected.to respond_to(:print_dishes) }
  it 'Has a hash of dishes' do
    expect(subject.menu).to be_instance_of(Hash)
  end

  describe '#print_dishes' do
    it 'prints a list of dishes and prices' do
      testmenu = Menu.new({ salmon: 10 })
      expect { testmenu.print_dishes }.to output("Our tasty menu:\nSalmon : £10.00\n").to_stdout
    end
  end

  describe '#select_dishes' do
    it { is_expected.to respond_to(:select_dishes).with(2).arguments }

    it 'Adds selected dishes to order' do
      subject.select_dishes({ salmon: 5 }, 1)
      expect(subject.order.basket).to include(salmon: 5)
    end
  end

end
