require 'takeaway'

describe Takeaway do

  let(:subject) do
    dishes = {burger: 10, fish: 8, sausage: 5, chips: 2}
    subject = described_class.new(dishes)
  end

  let(:delivery_time) do
    time = Time.new
    the_hour = time.hour
    the_minute = time.min
    "#{the_hour+1}:#{the_minute}"

  end


  describe '#see_dishes' do
    it 'responds to' do
      expect(subject).to respond_to(:see_dishes)
    end

    it 'displays the list of dishes' do
      expect { subject.see_dishes }.to output("Burger - £10\nFish - £8\nSausage - £5\nChips - £2\n").to_stdout
    end
  end

  describe '#add_dish' do
    it 'responds to' do
      expect(subject).to respond_to(:add_dish).with(2).arguments
    end

    it 'adds a dish to order' do
      subject.add_dish(:burger, 4)
      subject.add_dish(:chips, 1)
      expect(subject.order).to eq [:burger, :burger, :burger, :burger, :chips]
    end

    it 'outputs the current total to customer' do
      subject.add_dish(:burger, 4)
      expect { subject.add_dish(:chips, 5) }.to output("Current order total is £50.\n").to_stdout
    end
  end

  describe '#check_total_order_price' do
    it 'outputs the total price' do
      subject.add_dish(:burger, 4)
      subject.add_dish(:sausage, 1)
      subject.add_dish(:chips, 5)
      expect { subject.check_total_order_price }.to output("Final order total is £55.\n").to_stdout
    end
  end

  describe '#place_order' do
    it 'outputs to stdout that they have placed the order' do
      subject.add_dish(:burger, 4)
      subject.add_dish(:sausage, 1)
      subject.add_dish(:chips, 5)
      expect { subject.place_order }.to output("Thank you! Your order was placed and will be delivered before #{delivery_time}. A text will be sent to your phone shortly to confirm your order.\n").to_stdout
    end
  end

end
