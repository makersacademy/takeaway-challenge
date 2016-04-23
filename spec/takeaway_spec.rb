require 'takeaway'

describe Takeaway do

  it {should respond_to(:show_menu)}
  it {should respond_to(:select)}
  it {should respond_to(:check_total)}
  it {should respond_to(:send_text)}

  let(:item) {double :item}

  describe '#show_menu' do

    it "shows a list of items and prices" do
      expect(subject.show_menu).to eq(subject.menu)
    end

  end

  describe '#select' do

    it 'adds item to order' do
      subject.select(item)
      expect(subject.order.last).to eq item
    end
  end

end
