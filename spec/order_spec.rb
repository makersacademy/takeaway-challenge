require 'order'

describe Order do

  subject(:order) {Order.new("2-pizza, 3-Wrap", menu)}
  let(:order_string) { "" }
  let(:menu) {double :menu }


  describe '.input_instructions' do
    it 'Prints instructions to type a correct input' do
      expect(Order).to respond_to(:input_instructions)
    end
  end



  # describe '.parse' do
  #
  #   it 'Parses the input string' do
  #     num = rand(50)
  #     dummy_order = "#{rand(1..100).to_s}-test-dish_name," * num
  #     expect(parser.parse(dummy_order).length).to eq num
  #     expect(parser.parse(dummy_order).all? {|single_order| single_order.length == 2}).to be_truthy
  #   end
  #
  #   it 'Returns an array' do
  #     num = rand(50)
  #     dummy_order = "#{rand(100).to_s}-test-dish_name," * num
  #     expect(parser.parse(dummy_order)).to respond_to :[]
  #   end
  #
  #   it 'Raises an error if the input is invalid: missing number of portions' do
  #     expect{ parser.parse("Pizza, 3-Wrap") }.to raise_error \
  #     "Invalid input: please type a number followed by '-' and a dish name"
  #   end
  #
  #   it 'Raises an error if the input is invalid: invalid number of portions' do
  #     expect{ parser.parse("Foo-Pizza, 3-Wrap,foobar") }.to \
  #     raise_error "Invalid input: please type the number of portions for each dish"
  #   end
  # end

end
