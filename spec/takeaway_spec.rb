require 'takeaway'

describe Takeaway do
  let(:ta) { Takeaway.new }
  let(:selections) { ta.select("salad", 2)
  ta.select("pizza", 1)}

  describe '#menu' do
    it "shows the list of dishes with prices" do
    expect(subject.menu).to eq ta.menu
    end
  end

  describe '#begin_order' do
    it "defines the total of dishes wished to be ordered" do
      ta.begin_order(5)
      expect(ta.items).to eq 5
    end
  end

  describe '#select' do
    it "selects a dish a number of times" do
    ta.begin_order(3)
    selections
    expect(ta.order).to eq [{ dish: "salad", price: 3 }, { dish: "salad", price: 3 }, { dish: "pizza", price: 5}]
    end
  end

  describe '#place_order' do
    it "fails if wrong number of dishes was selected" do
        ta.begin_order(4)
        selections
        expect{ ta.place_order }.to raise_error "incorrect number of dishes" if ta.items != ta.order.length
    end
    it "confirms order was placed if no error is raised" do
        ta.begin_order(3)
        selections
        expect(ta.place_order).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end
  end

  describe 'send' do
    it "sends the text" do
      ta_db = instance_double(Takeaway)
      allow(ta_db).to receive(:send).and_return(system("ruby send_sms.rb"))
      expect(subject.send).to eq ta_db.send
    end
  end



end