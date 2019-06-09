require 'takeaway'

RSpec.describe Takeaway do
  let(:subject) { described_class.new }

  describe '#show_menu' do

    it 'return a list of dishes' do
      expect(subject.show_menu).to eq Takeaway::MENU
    end
  end

  describe '#select' do

    it 'returns a list of selected dishes and their number' do
      allow(subject).to receive(:selected_dishes).and_return({ :olives => 2, :pizza => 1 })
      expect(subject.selected_dishes).to eq({ :olives => 2, :pizza => 1 }) 
    end 
  end 

  # describe '#loop_usr_input' do

  #   it 'returns an array with the selected dish' do
  #     allow($stdin).to receive(:gets).and_return("olives")
  #     name = $stdin.gets
  #     allow(name).to receive(:to_sym) { :olives }
  #     name_to_sym = name.to_sym
  #     user_selection = []
  #     allow(user_selection).to receive(:push) { [name_to_sym] }
  #     expect(user_selection.push(name_to_sym)).to eq([:olives])
  #   end

  #   it 'should return a message if the dish is not in the menu' do
  #     allow($stdin).to receive(:gets).and_return("car")
  #     name = $stdin.gets
  #     user_selection = []
  #     allow(subject).to receive(:loop_user_input).with(user_selection) { 'The dish is not in the menu' }
  #     expect(subject.loop_user_input(user_selection)).to eq('The dish is not in the menu')
  #   end
  # end

  # describe '#store' do

  #   it 'returns an hash with the customer order' do
  #     takeaway = double(Takeaway.new)
  #     user_selection = [:olives, :pizza, :olives]
  #     allow(takeaway).to receive(:store).with(user_selection) { {:olives => 2, :pizza => 1 } }
  #     expect(takeaway.store(user_selection)).to eq({ :olives => 2, :pizza => 1 })
  #   end
  # end

end
