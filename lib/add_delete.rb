module AddDelete

  def add_all(add_list, list)
    add_list.uniq.each do |item|
      add_item(item, add_list, list)
    end
  end

  def delete_all(delete_list, list)
    delete_list.uniq.each do |item|
      delete_item(item, delete_list, list)
    end
  end

  private

  def add_item(item, add_list, list)
    @add_count = add_list.count(item)
    add_each(item, list)
    puts add_message(item)
  end

  def add_each(item, list)
    @add_count.times { list << item }
  end

  def add_message(item)
    "Added #{item} x#{@add_count}"
  end

  def delete_item(item, delete_list, list)
    @delete_count = delete_list.count(item)
    @order_count = list.count(item)
    check_deletable(item)
    delete_each(item, list)
    puts delete_message(item)
  end

  def check_deletable(item)
    raise(error_message(item)) if @delete_count > @order_count
  end

  def error_message(item)
    "Error: tried to delete #{@delete_count} #{item}(s) but order contained #{@order_count} #{item}(s)"
  end

  def delete_each(item, list)
    @delete_count.times do
      list.delete_at(list.index(item))
    end
  end

  def delete_message(item)
    "Deleted #{item} x#{@delete_count}"
  end
end
