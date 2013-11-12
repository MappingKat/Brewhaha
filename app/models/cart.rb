class Cart

  def initialize(cart_hash)
    @cart_hash = cart_hash
  end

  def cart_items
    @cart_items = []
    @cart_hash.each_key { |key| @cart_items << CartItem.new(key.to_i) }
    @cart_items
  end

  def find(item_id)
    cart_items.find { |ci| ci.item.id == item_id }
  end

  def add_item(item_id)
    if find(item_id)
      find(item_id).add
    else
      @cart_items << CartItem.new(item_id)
    end
  end

  def subtract_item(item_id)
    if find(item_id)
      find(item_id).subtract
    end
  end

  def delete_item(item_id)
    cart_items.delete_if { |ci| ci.item.id == item_id }
  end

  def clear
    @cart_items = []
  end

  def total
    cart_items.inject(0) { |total, ci| total + ci.subtotal }
  end

  def price
    ActionController::Base.helpers.number_to_currency(total * 0.01)
  end

  def to_h
    @cart_items.each_with_object(Hash.new) { |ci, hash| hash[ci.item.id] = ci.quantity }
  end

end
