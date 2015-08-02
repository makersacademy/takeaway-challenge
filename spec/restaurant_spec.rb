require 'restaurant'

describe Restaurant do
  let(:customer) {double (:customer)}
  let(:menuClass){double :menuClass, :new => menu}
  let(:menu) {double (:menu), :check_inclusion? => true}
  let(:subject) {described_class.new(menuClass)}

  describe '#create_customer' do
    it 'adds an instance of a Customer to the @customers variable' do
      subject.create_customer(customer)
      expect(subject.customers[0]).to be(customer)
    end
  end

  describe '#send_text' do
    it 'send a text message to the correct number, with the correct msg' do
      puts '  **This was tested manually**'
    end
  end

  describe '#display_menu' do
    it 'Asks the menu to display itself' do
      expect(subject.menu).to receive(:display_menu)
      subject.display_menu
    end
  end

  describe '#check_inclusion?' do
    it 'checks whether its menu includes the requested food item' do
      allow(menu).to receive(:check_inclusion?)
      expect(menu).to receive(:check_inclusion?)
      subject.check_inclusion? :pizza
    end
  end

  describe '#get_price' do
    it 'sends the get_price message to the restaurant\'s menu' do
      expect(menu).to receive(:price)
      subject.get_price :pizza
    end
  end

end
