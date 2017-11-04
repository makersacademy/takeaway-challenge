require 'menu'
class MenuDouble
  @dishes_choosen = [[1, 2], [3, 4]]
end
describe Menu do
  describe '#show_menu' do
    it 'Shows the menu list' do
      list = "Menu\n1. Pizza = £12\n2. Patatine = £4\n3. CocaCola = £3\n4. Lasagne = £4\n5. Polenta = £3\n"
      expect { subject.show_menu }.to output(list).to_stdout
    end
  end

  describe '#select_dishes' do
    it "Select dishes the user choice" do
      allow(subject).to receive(:gets).and_return('1', '2', "")
      subject.food_and_quantity
      expect { subject.select_dishes }.to output("You want to order:\n2 Pizza\n").to_stdout
    end
  end
  # NOT WORKING - TO FIX IT.
  describe '#food_and_quantity' do
    it "Ask to the user which dishes want to order and the quantity" do
      allow(subject).to receive(:gets).and_return('1', '2', '') #woow stubbed a while
      expect{ subject.food_and_quantity }.to output("Please write the number of the first dish you want to order. Then press Enter.\nWrite a number to indicate how many portion you wish.\nWrite the number of the next dish. If you've finish just press Enter.\n").to_stdout
    end
  end

  describe '#payment_message' do
    it "Check if payment_message puts the correct sum and message" do
      allow(subject).to receive(:gets).and_return('1', '2', "")
      subject.food_and_quantity
      expect { subject.payment_message }.to output("You have to pay £8\n").to_stdout
    end
  end
  describe '#user_payment' do
    it 'check if the user is paying the correct amount of money' do
      allow(subject).to receive(:gets).and_return('1', '2', "")
      subject.food_and_quantity
      subject.select_dishes
      subject.payment_message
      allow(subject).to receive(:gets).and_return('24')
      expect{ subject.user_payment }.to output("PAYMENT:\nPlease insert the amount of money:\n").to_stdout
    end
  end
  describe '#user_payment' do
    it 'check if the user is paying the correct amount of money' do
      allow(subject).to receive(:gets).and_return('1', '2', "")
      subject.food_and_quantity
      subject.select_dishes
      subject.payment_message
      allow(subject).to receive(:gets).and_return('24')
      expect{ subject.user_payment }.to output("PAYMENT:\nPlease insert the amount of money:\n").to_stdout
    end
  end
end


# Error message if the user do not puts number inside *dishes

#def total_price
#  @price = 0
#  @dishes.each do |price|
#    @price += price[1]
#  end
#  puts "#{@price.to_s}"
#end
