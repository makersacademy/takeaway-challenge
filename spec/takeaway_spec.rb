require 'takeaway'

describe Takeaway do
  let(:menu) { double('menu') }
  subject { Takeaway.new(menu) }

  describe '#show_menu' do
    
    it 'should present menu to user' do
      menu_dishes = 'dish'
      allow(menu).to receive(:pretty_dishes).and_return(menu_dishes)
      expect(subject).to receive(:puts).with(menu_dishes)

      subject.show_menu
    end
  end

  describe '#prompt' do

    before :each do
      expect(subject).to receive(:puts).with("Select an option:\n1.\tMenu\n9.\tExit")
    end

    it 'should display menu when 1 is entered' do
      user_input = "1\n"
      allow(subject).to receive(:gets).and_return(user_input)
      expect(subject).to receive(:show_menu)

      subject.prompt
    end

    it 'should exit application when 9 is entered' do
      user_input = "9\n"
      allow(subject).to receive(:gets).and_return(user_input)
      expect(subject).to receive(:exit).with(0)

      subject.prompt
    end

    it 'should request valid input when input is invalid' do
      user_input = "E\n"
      allow(subject).to receive(:gets).and_return(user_input)
      expect(subject).to receive(:puts).with("Please select a valid option")

      subject.prompt
    end
  end
end
