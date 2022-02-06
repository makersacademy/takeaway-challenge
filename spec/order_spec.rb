require 'order'
describe Order do
  describe '#choose_item' do
    it 'Can choose item from Menu' do
      subject.choose_dish("Fried Rice")
      expect(subject.ordered_items).to include("Fried Rice")
    end

    it 'Can choose item from Menu' do
        subject.choose_dish("Chicken")
        expect(subject.ordered_items).not_to include("Chicken")
      end
  end
end


# it "Lets you add a item to your choices" do
#     subject.add_item("Chicken",7)
#     subject.choose_dish("Chicken")
#     expect(subject.my_choices).to include("Chicken")
#   end

#   it "Won't let you add an item not on the menu" do
#     subject.choose_dish("Chicken")
#     expect(subject.my_choices).not_to include("Chicken")
#   end

#   it "Can calculate the total of a number of dishes" do
#     subject.choose_dish("Bryani")
#   end

#   it "Allows you to complete your order" do
#     subject.choose_dish("Bryani")
#     expect(subject.make_order).to eq("Bryani,7")

#   end

#   it "Sends a message to Twilio to send a text" do
#     texter = double()
#     allow(texter).to receive(:send_text).and_return(true)
#     expect(subject).to respond_to(:send_text)
#     expect(subject.send_text(texter)).to eq true
#   end

# end