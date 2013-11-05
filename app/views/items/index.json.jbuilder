json.array!(@items) do |item|
  json.extract! item, :available, :name, :description, :price, :cost, :category_id, :sort_order
  json.url item_url(item, format: :json)
end
