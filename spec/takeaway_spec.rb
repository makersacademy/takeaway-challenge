require 'takeaway'

describe Takeaway do

  describe '#print_menu' do

    it 'puts menu' do

      expect { subject.print_menu }.to output("Apple Pie: £4.5\nBanana Pie: £4.5\nTiramisu: £5\nCarrot Cake: £4\nBrownie: £4\n").to_stdout

    end

  end

  describe '#add_to_order' do

    it 'adds to order if part of menu' do

      subject.add_to_order("Apple Pie", 2)
      expect(subject.order.dishes_ordered).to eq ({ "Apple Pie" => 2 })

    end

    it 'raises an error if dish is no part of the menu' do

      expect { subject.add_to_order("Coffee Pie", 4) }.to raise_error 'Not part of the menu'

    end

  end

  describe '#check_order' do

    it 'prints complete order with total amount' do

      subject.add_to_order("Apple Pie", 2)
      subject.add_to_order("Tiramisu", 1)
      expect { subject.check_order }.to output("Apple Pie: 2 --> £9.00\nTiramisu: 1 --> £5.00\n--------------\nTotal --> £14.00\n").to_stdout

    end

  end

  describe '#prepare_message' do

    it 'return message to be sent' do

      expect(subject.prepare_message).to eq ("Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%k:%M")}")

    end

  end

end
