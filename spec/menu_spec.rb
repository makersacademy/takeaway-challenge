require 'menu'

describe Menu do
  let(:curry) { double(:dish, name: 'Curry', price: 5, formatted_display: "Curry - £5") }
  let(:rice) { double(:dish, name: 'Rice', price: 2, formatted_display: "Rice - £2") }

  describe '#add' do
    it 'adds a dish to menu list' do
      subject.add(curry)
      expect(subject.menu_list).to include curry
    end
  end

  describe '#display' do
    it 'displays all dishes in the menu list' do
      subject.add(curry)
      subject.add(rice)
      expect { subject.display }.to output("Menu List:\nCurry - £5\nRice - £2\n").to_stdout
    end
  end
end
