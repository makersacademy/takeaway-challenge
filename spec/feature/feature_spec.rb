# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes


# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order


# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

Dir["./lib/*.rb"].each { |file| require file }

describe 'New takeaway instance' do
  let(:messager) { double("Messager", send_message: nil) }
  let(:messager_class) { double("MessagerClass", new: messager) }

  dishes = []
  [["Copius Fried Wild Greens", 3],
  ["Spicy Sauteed Peppers", 3],
  ["Copius Mushroom Skewers", 5],
  ["Vegetable Omlette", 6],
  ["Fried Egg and Rice", 5],
  ["Monster Curry", 6],
  ["Mushroom Risotto", 5],
  ["Creamy Heart Soup", 8]].each { |item| dishes.append(Dish.new(name: item[0], cost: item[1])) }

  subject(:takeaway) { Takeaway.new(dishes, Order, messager_class) }

  context 'when #run' do
    it 'submits an order' do
      expect(takeaway).to receive(:gets).and_return("1")
      expect(takeaway).to receive(:gets).and_return("1")
      expect(takeaway).to receive(:gets).and_return("3")
      expect(takeaway).to receive(:gets).and_return("\n")
      expect(takeaway).to receive(:gets).and_return("4")
      expect(messager).to receive(:send_message).with(ENV['TWILIO_TO'], any_args)
      takeaway.run
    end
  end
end