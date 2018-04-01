require 'restaurant'
require 'menu'
describe Restaurant do
  subject(:takeaway) { described_class.new }
  describe 'order tests' do

    it 'has an order in basket once placed' do
      takeaway.order('curry')
      expect(takeaway.basket).to include ['curry', 1]
    end

    it 'shows the total' do
      takeaway.order('curry')
      takeaway.order('pasta')
      expect(takeaway.total).to eq 4
    end

    it 'raise an error if expect_total different than total' do
      error = "Hey it is 1.0 not 5"
      takeaway.order('curry')
      expect { takeaway.checkout(5) }.to raise_error error
    end

    it 'raise an error if empty order' do
      error = "Hey! - order something first"
      expect { takeaway.checkout(5) }.to raise_error error
    end
  end

  describe 'pretty prints basket and total for the client' do
    before do
      subject.order('curry')
      subject.order('pasta')
    end
    specify { expect { subject.basket_summary }.to output("curry\n1.0\npasta\n3.0\n\"Total: 4.0\"\n").to_stdout }
  end

  describe 'pretty prints todays menu for the client' do
    specify { expect { subject.todays_menu }.to output("curry\n1.0\npasta\n3.0\nbasta\n2.5\n").to_stdout }
  end

  it "receives a text message after the order is placed" do
    VCR.use_cassette('twilio') do
      takeaway.order('curry')
      takeaway.checkout(1)
    end
  end
end
