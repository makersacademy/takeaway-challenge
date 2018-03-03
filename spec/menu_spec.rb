require_relative '../lib/menu.rb'

describe Menu do

  describe '#show_menu' do
    it "allows the customer to read the menu" do
      expect { subject.show_menu }.to output.to_stdout
    end
  end
end
