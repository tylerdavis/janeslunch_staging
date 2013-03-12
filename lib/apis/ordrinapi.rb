module Ordrinapi

  def get_restaurant_response
    @restaurant_response = $ordrin.restaurant.get_details(@id)
  end

  # Pull restaurant core data
  def get_restaurant
    @restaurant = Restaurant.where(:ordrin_id => @restaurant_response['restaurant_id']).first_or_create(
      :addr => @restaurant_response['addr'],
      :addr2 => @restaurant_response['addr2'],
      :city => @restaurant_response['city'],
      :cs_contact_phone => @restaurant_response['cs_contact_phone'],
      :cuisine => @restaurant_response['cuisine'],
      :name => @restaurant_response['name'],
      :ordrin_id => @restaurant_response['restaurant_id'],
      :postal_code => @restaurant_response['postal_code'],
      :state => @restaurant_response['state']
    )
  end

  # Iterate over restaurant details, and build item objects with
  # their associated options and suboptions
  def get_items
    @restaurant_response['menu'].each do |category|
      unless @@pass_on_categories.include?(category['name'])
        category['children'].each do |item|
          if (item['price'].to_f < @@Max_price) && (item['price'].to_f > @@Min_price)
            new_item = Item.where(:ordrin_id => item['id'].to_i).first_or_create(
              :name => item['name'],
              :price => item['price'],
              :descrip => item['descrip'],
              :ordrin_id => item['id']
            )
            if item['children']
              # Options parsing
              item['children'].each do |option|
                option_hash = Option.where(:ordrin_id => option['id'].to_i).first_or_create(
                  :name => option['name'],
                  :descrip => option['descrip'],
                  :ordrin_id => option['id'],
                  :price => option['price']
                )
                if option['children']
                  option['children'].each do |suboption|
                    # Suboption parsing
                    option_hash.suboptions << Suboption.where(:ordrin_id => option['id'].to_i).first_or_create(
                      :name => suboption['name'],
                      :descrip => suboption['descrip'],
                      :price => suboption['price'],
                      :ordrin_id => suboption['id']
                    )
                  end
                  new_item.options << option_hash
                  option_hash.save
                end
              end
            end
            @restaurant.items << new_item
            new_item.save
          end
        end
      end
    end
  end

end