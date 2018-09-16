require 'printer'

describe Printer do
  describe '#display_menu' do
    it 'displays name and price of each dish' do
      response = "Fish and Chips £12.95\n"
      expect { subject.display_menu("Fish and Chips", 1295) }.to output(response).to_stdout
    end
  end

  describe '#format_order' do
    it 'displays name, price, qty, subtotal' do
      response = "Fish and Chips £12.95\tx4\t£51.80\n"
      expect { subject.format_order("Fish and Chips", 1295, 4, 5180) }.to output(response).to_stdout
    end
  end

  describe '#format_total' do
    it 'displays grand total for order' do
      response = "Total:\t£51.80\n"
      expect { subject.format_total(5180) }.to output(response).to_stdout
    end
  end
end
