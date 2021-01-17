module DishFilter

  def find_by_id(dishes, id)
    for dish in dishes
      return dish if id == dish["id"]
    end

    return nil
  end

end