require 'restaurant'

describe Restaurant do

let(:subject) {Restaurant.new({"Pizza" => 12,"Pasta" => 13})}
let(:menu) { double(:menu, dishes: {"Pizza" => 12,"Pasta" => 13})}

  it 'allows to select dishes with quantities' do
    expect(subject).to respond_to(:select_dish).with(2).arguments
  end

  it 'allows to reset order' do
    subject.select_dish("Pizza",2)
    subject.order_reset
    expect(subject.order).to eq({})
  end

  describe '#select_dish' do

    it "raises an error if dish is not available" do
      expect{subject.select_dish("Cod",2)}.to raise_error("Sorry, dish is not available")
    end

    it "select dishes and assign quantities" do
      subject.select_dish("Pizza",2)
      expect(subject.select_dish("Pasta",3)).to eq({"Pizza"=>2,"Pasta"=>3})
    end
  end

  describe '#submit_order' do

  context 'when payment amount is not correct' do
    it "raises an error" do
      subject.select_dish("Pizza",2)
      expect{subject.submit_order(25)}.to raise_error("Please key in the right amount")
    end
  end

  context 'when payment amount is correct' do
    it "sends a confirmation message" do
      subject.select_dish("Pizza",2)
      expect(subject.submit_order(24)).to eq("Your order has been placed successfully. You will receive a confirmation text message.")
    end
  end

  end

  #describe '#right_amount?' do
    #it "calculates bill" do
    #  subject.select_dish("Pizza",2)
    #  subject.select_dish("Pasta",2)
    #  expect(subject.right_amount?(50)).to eq true
    #end
  #end


end
