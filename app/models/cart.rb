class Cart

  def initialize(cart_hash)
    @cart_hash = cart_hash
  end

  def cart_items
    @cart_items ||= @cart_hash.collect { |key, value| CartItem.new(key.to_i, value.to_i) }
  end

  def find_cart_item(item_id)
    cart_items.find { |ci| ci.item_id == item_id.to_i }
  end

  def add_item(item_id)
    if find_cart_item(item_id)
      find_cart_item(item_id).add
    else
      @cart_items << CartItem.new(item_id)
    end
  end

  def subtract_item(item_id)
    if find_cart_item(item_id)
      find_cart_item(item_id).subtract
    end
  end

  def delete_item(item_id)
    cart_items.delete_if { |ci| ci.item_id == item_id.to_i }
  end

  def clear
    @cart_items = []
  end

  def total
    cart_items.inject(0) { |total, ci| total + ci.subtotal }
  end

  def empty?
    cart_items.size == 0
  end

  def price
    ActionController::Base.helpers.number_to_currency(total * 0.01)
  end

  def to_h
    cart_items.each_with_object(Hash.new) { |ci, hash| hash[ci.item_id] = ci.quantity }
  end

end
