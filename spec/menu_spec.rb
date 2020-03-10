require 'menu'
describe Menu do
  it { is_expected.to respond_to(:show_menu) }

  context '#show_menu' do
    it "returns list of dishes" do
      expect(subject.show_menu).to eq(subject.menu)
    end

    it "shows pretty menu" do
      subject.instance_variable_set(:@menu, { "dish": 1 })
      expect { subject.show_menu }.to output("dish: £1\n").to_stdout
    end
  end
end
