require 'terminal-table'

module DisplayOutput
  def convert_price pence
    format('%.2f', pence / 100.00)
  end

  def display_list heading_array, items, include_total = false
    total_price = 0
    header = heading_array
    rows = []
    items.each do |item|
      rows << [item.order_code, item.description, convert_price(item.price)]
      total_price += item.price
    end
    rows << ['', 'TOTAL', convert_price(total_price)] if include_total
    table = Terminal::Table.new headings: header, rows: rows
    puts table
  end
end