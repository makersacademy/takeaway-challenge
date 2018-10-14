require './lib/takeaway'

describe Takeaway do
  # let(:menu) { double :menu, :display => "Margarita Pizza, £8\nHamburger, £6\nChips, £2\n"}
  # before (:each) do
  #   subject = Takeaway.new(menu)
  # end

  context '#show_menu' do
    it 'displays a menu' do
      expect { subject.show_menu }.to output("Margarita Pizza, £8\nHamburger, £6\nChips, £2\n").to_stdout
    end
  end
end
