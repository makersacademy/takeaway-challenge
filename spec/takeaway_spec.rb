# frozen_string_literal: true

require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new(order) }
  let(:menu1) { double(:menu1) }
  let(:order) { double(:order) }

  let(:test_menu) { 'Burger: £5' }

  let(:dishes) { ['Burger', 3, 'Fish', 2] }

  it 'prints the menu' do
    allow(order).to receive(:menu) { menu1 }
    allow(menu1).to receive(:print_items) { test_menu }
    expect { takeaway.print_menu }.to output(test_menu).to_stdout
  end

  it 'adds multiple dishes ordered to basket' do
    allow(order).to receive(:menu) { menu1 }
    allow(order).to receive(:basket_total)
    expect(order).to receive(:add_item).twice
    takeaway.order_process(dishes)
  end
end
