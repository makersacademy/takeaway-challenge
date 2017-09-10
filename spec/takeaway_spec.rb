require 'takeaway'
describe Takeaway do
  describe '#read' do
    it 'has method' do
      is_expected.to respond_to(:read)
    end

    it'return default menu list' do
      output = subject.menu_list.each { |item, price| "#{item} : #{price}" }
      expect(subject.read).to eq output
    end

    it'return new menu list' do
      list = { "Spring Roll" => 0.99, "Fried Prawn" => 2.99 }
      takeaway = Takeaway.new(list)
      output = takeaway.menu_list.each { |item, price| "#{item} : #{price}" }
      expect(takeaway.read).to eq output
    end
  end

  describe '#add_to_order' do
    it 'is method and take 1 arguments' do
      is_expected.to respond_to(:add_to_order).with(1).argument
    end
    it 'is method and take 2 arguments' do
      is_expected.to respond_to(:add_to_order).with(2).argument
    end
  end
end
