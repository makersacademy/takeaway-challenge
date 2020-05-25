require 'takeaway'

describe TakeAway do
  let(:double_options_display) do 
    "WELCOME, PLEASE ENTER ONE OF THE FOLLOWING:" + "\n" +
    "~" * 45 + "\n" +
    "> To see the takeaway menu enter:".ljust(35, ' ') + "'menu'".rjust(10, ' ') + "\n" +
    "> To place an order enter:".ljust(35, ' ') + "'order'".rjust(10, ' ') + "\n" +
    "> To see your basket enter:".ljust(35, ' ') + "'basket'".rjust(10, ' ') + "\n" +
    "> To checkout your order enter:".ljust(35, ' ') + "'checkout'".rjust(10, ' ') + "\n" +
    "> To exit hit Return" + "\n"
  end

  describe '#initialize' do
    it 'is expected to respond to #new with 2 argument' do
      expect(TakeAway).to respond_to(:new).with(2).arguments
    end
  end

  describe '#start' do
    it 'displays an options menu' do
      allow(subject).to receive(:process).and_return(exit) # prevent process loop from starting
      expect { subject.start }.to output(double_options_display).to_stdout
    end
  end
end
