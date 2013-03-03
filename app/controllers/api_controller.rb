require 'ordrin'
require 'pry'

Max_price = 14
Min_price = 8

api = Ordrin::APIs.new('fm3dbwwelhFXZdPnajn7HSaq28d508QJCDP62ViYAGY', :test)

a = api.restaurant.get_details(141)

pass_on_categories = ['Starters', 'Sides', 'Gatorade', 'Biodegradable Disposables', '2-Liter Bottles', '20 Oz Bottles', 'Bottled Water', 'Ice', 'Menu Guide', 'Red Bull']

items = []

a['menu'].each do |category|
  unless pass_on_categories.include?(category['name'])
    category['children'].each do |item|
      if item['price'].to_f < Max_price && item['price'].to_f > Min_price
        item_hash = {
          :name => item['name'],
          :price => item['price'],
          :descrip => item['descrip'],
          :id => item['id'].to_i
        }
        if item['children']
          p "We have #{item['children'].count} sub-options for #{item['name']}"
          item['children'].each do |option|
            p "- #{option['name']}"
            option['children'].each do |suboption|
              p "- - id##{suboption['id']} - #{suboption['name']} - $#{suboption['price']}"
            end
          end
        end
        items << item_hash
      end
    end
  end
end

binding.pry