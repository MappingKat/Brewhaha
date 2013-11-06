require 'csv'
require './app/models/item'

class Seeder

  def self.item_csv_data
    CSV.read("./brewhaha_items.csv", headers: true, header_converters: :symbol)
  end

  def self.load_items_csv
    item_csv_data.each do |row|
      Item.create({
        "id"          => row[:id],
        "available"   => row[:available],
        "name"        => row[:name],
        "description" => row[:description],
        "category_id" => row[:category_id],
        "price"       => row[:price],
        "cost"        => row[:cost],
        "sort_order"  => row[:sort_order]
      })
    end
  end

end
