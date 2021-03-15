require './lib/take_away.rb'

describe TakeAway do
  let(:menu) { { 'Shio Ramen' => 5.50, 'Shoyu Ramen' => 6 } }
  let(:basket) { { 'Shio Ramen' => quantity } }
  let(:quantity) { 2 }
  let(:dish) { 'Shio Ramen' }
  let(:t) { TakeAway.new }
  describe '#initialize' do
    it 'has a @menu variable' do
      expect(subject.menu).not_to be_empty
    end
  end 

  describe '#read_menu' do
    it 'shows list of dishes and prices' do
      expect(subject.read_menu).to eq(subject.menu)
    end
  end

  describe '#order' do
    it { is_expected.to respond_to(:order) }
    it 'adds dish to basket in a specific quantity' do
      subject.order(dish, quantity)
      expect(subject.basket).to eq({ dish => quantity })
    end
  end
  describe '#basket_message' do
    it 'shows message that an item is added to basket' do
      expect(subject.order(dish, quantity)).to eq("#{quantity}x #{dish}(s) added to your basket.")
    end
  end
  describe '#basket_summary' do
    it 'calculates summary of the order' do
      t.order('Shio Ramen', 2)
      expect(t.basket_summary).to eq(["#{quantity}x #{dish}(s) = £#{menu['Shio Ramen'] * quantity}"])
    end
  end
  describe '#total' do
    it 'adds up the prices for all basket items' do
      t.order('Shio Ramen', 2)
      t.order('Shoyu Ramen', 4)
      expect(t.total).to eq((menu['Shio Ramen'] * 2) + (menu['Shoyu Ramen'] * 4))
    end
  end
  describe '#checkout' do
    it 'puts a message with the time of order' do
      t.order('Shio Ramen', 2)
      delivery_hour = '%02d' % (Time.new.hour + 1)
      delivery_minutes = '%02d' % Time.new.min
      expect(t.check_out(t.total)).to eq("Thank you! Your order was placed and will be delivered before #{delivery_hour}:#{delivery_minutes}")
    end
  end
end
