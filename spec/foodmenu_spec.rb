require 'foodmenu'

describe FoodMenu do

  context '#display' do
    it 'works' do
      expect(subject).to receive(:display)
      subject.display
    end

    it 'displays the menu' do
      message = "1. Edamame £2.5\n2. Miso Soup £1.95\n3. Chicken Gyoza £4.95\n4. Salmon Nigiri £2.95\n5. Salmon Roe Gunkan £4.95\n"
      expect{ subject.display }.to output(message).to_stdout
    end
  end

end
