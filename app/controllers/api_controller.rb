require 'ordrin'
require 'pry'

Max_price = 14
Min_price = 8

api = Ordrin::APIs.new('fm3dbwwelhFXZdPnajn7HSaq28d508QJCDP62ViYAGY', :test)

a = api.restaurant.get_details(143)

pass_on_categories = ['Starters', 'Sides', 'Gatorade', 'Biodegradable Disposables', '2-Liter Bottles', '20 Oz Bottles', 'Bottled Water', 'Ice', 'Menu Guide', 'Red Bull']

items = []

a['menu'].each do |category|
  unless pass_on_categories.include?(category['name'])
    category['children'].each do |item|
      if (item['price'].to_f < Max_price) && (item['price'].to_f > Min_price)
        options = []
        if item['children']
          item['children'].each do |option|
            suboptions = []
            if option['children']
              option['children'].each do |suboption|
                suboption_hash = {
                  :name => suboption['name'], 
                  :descrip => suboption['descrip'], 
                  :price => suboption['price'], 
                  :id => suboption['id'].to_i
                }
                suboptions << suboption_hash
              end
            option_hash = {
              :name => option['name'], 
              :descrip => option['descrip'], 
              :id => option['id'].to_i, 
              :price => option['price'],
              :suboptions => suboptions
            }
            options << option_hash
            end
          end
        end
        item_hash = {
          :name => item['name'],
          :price => item['price'],
          :descrip => item['descrip'],
          :id => item['id'].to_i,
          :options => options
        }
        items << item_hash
      end
    end
  end
end

binding.pry