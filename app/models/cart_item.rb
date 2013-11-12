class CartItem

  attr_reader :item_id, :quantity

  def initialize(item_id, quantity=1)
    @item_id = item_id
    @quantity = quantity || 1
  end

  def item
    @item ||= Item.find(item_id)
  end

  def name
    item.name
  end

  def add
    @quantity += 1
  end

  def subtract
    @quantity == 0 ? @quantity : @quantity -= 1
  end

  def subtotal
    item.price * quantity
  end

  def price
    ActionController::Base.helpers.number_to_currency(subtotal * 0.01)
  end

end
