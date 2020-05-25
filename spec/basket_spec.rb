require 'basket'

describe Basket do
  let(:double_data) { { "spring roll" => "0.99", "pork dumpling" => "2.99", "peking duck" => "7.99" } }
  let(:double_order) { { "spring roll" => 3, "pork dumpling" => 6, "peking duck" => 13 } }
  let(:double_basket_display) do
    "BASKET\n" +
    "=" * 39 + "\n" +
    "3x".ljust(5, ' ') + "Spring Roll(s)".ljust(26, ' ') + " £2.97\n" +
    "6x".ljust(5, ' ') + "Pork Dumpling(s)".ljust(26, ' ') + " £17.94\n" +
    "13x".ljust(5, ' ') + "Peking Duck(s)".ljust(26, ' ') + " £103.87\n" +
    "-" * 39 + "\n" +
    "TOTAL:".ljust(32, ' ') + "£124.78\n"
  end
  
  let(:basket) { Basket.new(double_order) }
  
  describe '#initialize' do 
    it 'is expected to respond to #new with 1 argument' do
      expect(Basket).to respond_to(:new).with(1).argument
    end
  end

  describe '#show_basket' do 
    it 'displays a breakdown of the user\'s order' do
      allow(basket).to receive(:load_data) { double_data } 
      expect { basket.show_basket }.to output(double_basket_display).to_stdout
    end
  end
end
