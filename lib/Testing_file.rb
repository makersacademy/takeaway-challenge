
----------------------------------
| Name     | Product ID | Amount |
|----------|----------------------
| Robert   |     P1     |   2    |
| Michael  |     P2     |   1    |
| Leonard  |     P2     |   1    |
| Robert   |     P2     |   4    |
| Robert   |     P3     |   2    |
| Michael  |     P3     |   1    |
----------------------------------

    result = []
    Order.all.group_by(&:name).each do |name, orders|
      record = {}
      record["name"] = name
      orders.each do |order|
        record[order.product_id] = order.amount
      end
      result.append(record)
    end 