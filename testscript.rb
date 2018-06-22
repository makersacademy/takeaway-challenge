
  items = [{ name: 'test dish 2', price: '£2.02', veggie: nil },{ name: 'test dish 1', price: '£1.01', veggie: nil }]
  puts items.map { |item| item[:price].gsub(/£/, '').to_f }.sum.round(2)
