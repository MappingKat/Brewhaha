json.array!(@categories) do |category|
  json.extract! category, :available, :name, :description, :sort_order
  json.url category_url(category, format: :json)
end
