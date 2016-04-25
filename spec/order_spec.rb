require 'order'

describe Order do

  let(:order) {double(:order)} # add in responses to complete? message
  let(:menu) {double(:menu)}
  let(:messenger) {double(:messenger)}
  let(:order_class) {double(:order_class, new: order)}
  let(:menu_class) {double(:menu_class, new: menu)}
  let(:messenger_class) {double(:messenger_class, new: messenger)}

  it{should respond_to(:add_to_order)}
  it{should respond_to(:show_order)}
  it{should respond_to(:check_total)}

  describe '#initialize' do
    it 'starts with empty order' do
      expect(subject.show_order).to eq({})
    end

    it 'starts with an empty total' do
      expect(subject.check_total).to be_nil
    end
  end

  describe '#add_to_order' do

    it 'adds quantity and item to order' do
    # quantity = 5
    # item = {"venison sushi" => 3.50}
      subject.add_to_order(5,"venison sushi")
      expect(subject.show_order).to eq({5 => {"venison sushi" => 2.5}})
    end
  end

    describe '#check_total' do

      let(:quantity) {5.0}
      let(:price_per_unit) {3.3}
      let(:food) {double :food}

      it 'calculates total cost of basket' do
        quantity = 1
        item = "venison sushi"
        price_per_unit = 2.50
        subject.add_to_order(quantity,item)
        expect(subject.check_total).to eq(quantity * price_per_unit)
      end
    end
end
