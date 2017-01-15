require 'takeaway'
require 'menu'

describe Takeaway do

  context '#view_menu' do
    it 'prints menu to stdout' do
      takeaway = Takeaway.new
      expect{takeaway.view_menu}.to output.to_stdout
    end
  end

  context '#place_order' do

    context '#prompt' do
      it 'prompts user to input order' do
        takeaway = Takeaway.new
        expect{takeaway.prompt}.to output.to_stdout
      end
    end

    context '#orderloop' do
      it 'loops over order input method while input != nil' do
        takeaway = Takeaway.new
        takeaway.place_order
        allow(:$stdin).to receive_messages
      end
      it 'loops over order input method until Enter is pressed twice' do
        allow(:$stdin) {"Grappa, 5\n\n"}.to output.to_stdout
      end

    end
    context '#print_order' do
      it 'prints order for review once finished' do
        allow(:$stdin) {"Grappa, 5"}
        takeaway = Takeaway.new
        expect{takeaway.print_order}.to output{'@list=[["Grappa", "5"]]'}.to_stdout
      end
    end

    context '#confirm_order' do
      it 'allows user to confirm order' do
        takeaway = Takeaway.new
        takeaway.place_order
        allow(:$stdin) {"Grappa, 5"}
        expect(takeaway).to respond_to(:confirm_order)
      end
    end

  end

end
