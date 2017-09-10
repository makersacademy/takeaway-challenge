require 'takeway'
describe Takeway do
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
      takeway = Takeway.new(list)
      output = takeway.menu_list.each { |item, price| "#{item} : #{price}" }
      expect(takeway.read).to eq output
    end
  end
end
