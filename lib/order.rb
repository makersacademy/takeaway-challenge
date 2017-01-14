class order

customer_order = { id:, items:[],total: }


def create_order

end
#hashnum.list.fetch(ID or name_of_dish"a")  to get price out of hash
#exception will be key error if ID or dish not in hash
def order_total
  order_total = items.sum do |item|
  order_total = (item.quantity * item._price)
  order_total.round(2)
end

end

def check_total
end

def pass_order_num_customer_SMS

end
end
