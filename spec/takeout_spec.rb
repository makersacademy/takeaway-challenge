require 'takeout'
require 'send_sms'

describe Takeout do
  let(:texter) { double :texter }
  before do
    @dishes = { :lasagna => 10, :pizza => 12, :burger => 10, :chips => 2 }
    @texter = texter
  end

  def format_dishes
    @dishes.each do |dish, price|
      puts "#{dish.to_s.capitalize}: £#{price}"
    end
    nil
  end

  it 'works' do
    expect(subject.class).to eq described_class
  end

  it 'can pick a menu'

  context '#add_dish' do

    it 'can add a dish to basket' do
      subject.add_dish(:lasagna)
      expect(subject.basket).to include([:lasagna, 10, 1])
    end

    it 'can fill basket with multiple items' do
      subject.add_dish(:lasagna)
      subject.add_dish(:pizza)
      expect(subject.basket).to include([:lasagna, 10, 1] && [:pizza, 12, 1])
    end

    it 'can add multiples of the same dish' do
      subject.add_dish(:lasagna, 4)
      expect(subject.basket).to include([:lasagna, 10, 4])
    end

    it 'gives informative message to user' do
      message = '5x Lasagna added to basket'
      expect { subject.add_dish(:lasagna, 5) }.to output(message).to_stdout
    end

  end

  context '#total_price' do
    it 'returns nothing at start' do
      expect(subject.total_price).to be_zero
    end

    it 'returns the price of a dish' do
      subject.add_dish(:lasagna)
      expect(subject.total_price).to eq 10
    end

    it 'adds up the prices of multiple dishes' do
      subject.add_dish(:lasagna)
      subject.add_dish(:pizza)
      expect(subject.total_price).to eq 22
    end

    it 'compensates for multiples of the same dish' do
      subject.add_dish(:lasagna, 4)
      expect(subject.total_price).to eq 40
    end
  end

  context '#delete_from_basket' do
    before do
      subject.add_dish(:lasagna, 2)
      subject.add_dish(:pizza)
      subject.add_dish(:burger, 50)
    end
    it 'can remove an item' do
      message = "2x Lasagna = £20\n50x Burger = £500\n"
      subject.delete_from_basket(:pizza)
      expect { subject.current_basket }.to output(message).to_stdout
    end
    it 'can delete some extras of items' do
      message = "2x Lasagna = £20\n1x Pizza = £12\n25x Burger = £250\n"
      subject.delete_from_basket(:burger, 25)
      expect { subject.current_basket }.to output(message).to_stdout
    end

    it 'can delete "all" from basket' do
      subject.delete_from_basket("all")
      expect(subject.current_basket).to be_nil
    end
  end

  context '#current_basket' do
    it 'shows an added item' do
      message = "1x Lasagna = £10\n"
      subject.add_dish(:lasagna)
      expect { subject.current_basket }.to output(message).to_stdout
    end

    it 'shows multiple added items' do
      message = "1x Lasagna = £10\n1x Pizza = £12\n"
      subject.add_dish(:lasagna)
      subject.add_dish(:pizza)
      expect { subject.current_basket }.to output(message).to_stdout
    end
  end

  context '#read_menu' do
    it 'outputs the menu in legible format' do
      expect { subject.read_menu }.to output(format_dishes).to_stdout
    end
  end

  context '#checkout' do
    before do
      @success = 'Success! Your order has been placed.'
    end
    it 'raises an error if wrong sum is given' do
      subject.add_dish(:chips)
      expect { subject.checkout(3) }.to raise_error 'Incorrect sum'
    end

    it 'raises errors for multiple orders & incorrect sum' do
      subject.add_dish(:lasagna)
      subject.add_dish(:pizza)
      expect { subject.checkout(21) }.to raise_error 'Incorrect sum'
    end

    it 'sends text message when complete' do
      complete_order = "Your order total price is £22"
      message = "#{@success} #{complete_order}"
      subject.add_dish(:lasagna)
      subject.add_dish(:pizza)
      expect(subject).to receive(:send_text).with(message)
      subject.checkout(22)
    end
  end
end
