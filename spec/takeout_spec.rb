require 'takeout'
require 'send-sms'

describe Takeout do
  before do
    @l_output = "Lasagna: £10\n"
    @l_and_p = "Lasagna: £10\nPizza: £12\n"
    @dishes = { :lasagna => 10, :pizza => 12, :burger => 10, :chips => 2 }
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

  context '#add_dish' do

    it 'can add a dish to basket' do
      subject.add_dish(:lasagna)
      subject.basket.each {}
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

  context '#check_price' do
    it 'lists total price and dishes in basket' do
      subject.add_dish(:lasagna)
      subject.add_dish(:pizza)
      total = "Total price: £22\n"
      message = "#{total}#{@l_and_p}"
      expect { subject.check_price }.to output(message).to_stdout
    end
  end

  context '#current_basket' do
    it 'shows an added item' do
      subject.add_dish(:lasagna)
      expect { subject.current_basket }.to output(@l_output).to_stdout
    end

    it 'shows multple added items' do
      subject.add_dish(:lasagna)
      subject.add_dish(:pizza)
      expect { subject.current_basket }.to output(@l_and_p).to_stdout
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
      complete_order = "#Your order total price is £22"
      message = "Success! Your order has been placed. #{complete_order}"
      subject.add_dish(:lasagna)
      subject.add_dish(:pizza)
      expect(subject).to receive(:send_text).with(message)
      subject.checkout(22)
    end
  end
end
