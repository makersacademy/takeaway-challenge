require_relative '../lib/menu.rb'

RSpec.describe Menu do
  let(:menu)   { described_class.new }
  
  it { is_expected.to be_a Menu }
  it { is_expected.to respond_to :print_menu }

  it "prints a menu" do
    expect { menu.print_menu }.to output(String).to_stdout
  end
end
