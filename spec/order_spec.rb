require './lib/order'

describe Order do
  let(:menu) { double(:menu, dish: {:beef_burger => 4.0, :fish_burger => 2.0}) }
  let(:menu_klass){ double(:menu_klass, :new => :menu) }
  let(:item) {:beef_burger}
  let(:item2) {:fish_burger}
  let(:qty) {2}

  it 'select some number of several available dishes from the menu' do
    hash = {}
    hash[item] = qty
    expect(subject.add_order(item, qty)).to eq hash
  end

  describe '#basket_sum' do
    it 'should raise error if basket is empty' do
      expect{subject.basket_sum}.to raise_error('Basket is empty')
    end

    it 'should return basket summary' do
      subject.add_order(item, qty)
      message = "#{item} x #{qty} = £#{(menu.dish[item]*qty)}"
      expect(subject.basket_sum).to eq message
    end
  end

  it 'should ouput the total sum of the order' do
    total = 12.0
    message =   "Your total is: #{total}"
    subject.add_order(item, qty)
    subject.add_order(item2, qty)
    expect(subject.total_sum).to eq message
  end
end
