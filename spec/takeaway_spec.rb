# frozen_literial_string: true

require 'takeaway'

RSpec.describe TakeAway do
  let(:output) { StringIO.new }
  let(:takeaway) { described_class.new(output) }

  it 'has a menu' do
    result = takeaway.instance_variable_get(:@menu)

    expect(result).to eq(menu)
  end

  describe '#read_menu' do
    it { expect(takeaway).to respond_to(:read_menu) }

    it 'prints dishes with prices' do
      takeaway.read_menu

      expect(output.string).to include("spring roll: £0.99
char sui bun: £3.99
pork dumpling: £2.99
peking duck: £7.99
fu-king fried rice: £5.99")
    end
  end

  describe '#add_dish' do
    it { expect(takeaway).to respond_to(:add_dish).with(1).argument }

    it 'raises error unless passed a sting' do
      expect { takeaway.add_dish(1) }.to raise_error 'item off menu required'
    end

    context 'when on menu' do
      let(:spring_roll) { { 'spring roll' => 0.99 } }

      it 'adds dish given to basket' do
        takeaway.add_dish('spring roll')

        expect(takeaway.basket.last).to eq spring_roll
      end

      it 'adds same dish given to basket' do
        takeaway.add_dish('spring roll')
        takeaway.add_dish('spring roll')

        expect(takeaway.basket).to eq [spring_roll, spring_roll]
      end

      it 'adds dish using capital letters to basket' do
        takeaway.add_dish('Spring Roll')

        expect(takeaway.basket.last).to eq spring_roll
      end
    end

    context 'when not on menu' do
      it 'does not add to basket' do
        takeaway.add_dish('not on menu')

        expect(takeaway.basket).to be_empty
      end

      it 'prints message that item is not on menu' do
        takeaway.add_dish('not on menu')

        expect(output.string).to include('item not on menu')
      end
    end
  end

  describe '#check_order' do
    it 'prints items in basket with total' do
      order_meal
      takeaway.check_order

      expect(output.string).to include(basket_items_with_total)
    end

    it 'repesents multiples of same item' do
      takeaway.add_dish('peking duck')
      takeaway.add_dish('spring roll')
      takeaway.add_dish('spring roll')

      takeaway.check_order

      expect(output.string).to include(
"1 x peking duck: £7.99\n2 x spring roll: £0.99\nTotal: £9.97\n"
)
    end
  end

  def menu
    {
      'spring roll' => 0.99,
      'char sui bun' => 3.99,
      'pork dumpling' => 2.99,
      'peking duck' => 7.99,
      'fu-king fried rice' => 5.99
    }
  end

  def order_meal
    takeaway.add_dish('peking duck')
    takeaway.add_dish('pork dumpling')
    takeaway.add_dish('spring roll')
    takeaway.add_dish('fu-king fried rice')
  end

  def basket_items_with_total
    "1 x peking duck: £7.99
1 x pork dumpling: £2.99
1 x spring roll: £0.99
1 x fu-king fried rice: £5.99
Total: £17.96"
  end
end
