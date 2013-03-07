class GroupsController < ApplicationController
  before_filter :authenticate_user!

  @@meat = ['beef', 'chicken', 'pork', 'ham', 'tongue', 'meatball', 'bacon', 'sausage', 'salmon', 'pepperoni', 'tuna', 'halibut', 'shrimp']

  def index
    @group_name = params['groupname']
  end

  def new
    @group = Group.new
  end

  def create
    if user_signed_in?
      @group = Group.new(params[:group])
      @group.users << current_user
      if @group.save
        redirect_to "/#{@group.name}", :notice => "Your group is ready!"
      else
        render "new"
      end  
    end
  end

  def show
    get_group
    unless @group
      redirect_to '/u'
    else
      if @group.group_orders.from_today.size == 0
        new_group_order
        @group.group_orders << @group_order
      else 
        @group_order = @group.group_orders.from_today.first
      end

      if @group_order.restaurant_id
      else
        redirect_to '/u', :notice => "Sorry, it looks like no one is delivery to your location at the moment."
      end

    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to groups_path, :notice => "You updated your group!"
    else
    end
  end

  def get_group
    @group = Group.where(:name => params['groupname']).first
    # @group = Group.find(1)
  end

  def new_group_order
    @group_order = GroupOrder.new
    @group_order.group = @group

    if (get_restaurant != false)
      get_choices 
    end
  end

  def get_restaurant
    time = @group.lunch_time
    time = DateTime.parse(time + ' Eastern')
    address = @group.address_for_ordr
    begin
      restaurants = $ordrin.restaurant.get_delivery_list(time, address)
      id = restaurants.sample['id'] || 0
    rescue Exception => e
      p "There was an error pulling a restaurant - #{e}"
      return false
    end

    restaurant_controller = RestaurantController.new
    restaurant = restaurant_controller.create(id)
    # raise restaurant.inspect
    @group_order.restaurant = restaurant
    restaurant.save
  end

  def get_choices
    get_restaurant
    meat_choice = get_item(@@meat)
    @group_order.items << meat_choice
    meat_choice.save
    chicken_choice = get_item(['chicken'])
    @group_order.items << chicken_choice
    chicken_choice.save
    vegie_choice = get_item_thats_not(@@meat)
    @group_order.items << vegie_choice
    vegie_choice.save
  end

  def get_item(keywords)
    options = []
    keywords.each do |keyword|
      @group_order.restaurant.items.each do |item|
        if (item.name.downcase.include? keyword) || (item.descrip.downcase.include? keyword)
          options << item
        end
      end
    end
    options.sample
  end

  def get_item_thats_not(keywords)
    options = []
    keywords.each do |keyword|
      @group_order.restaurant.items.each do |item|
        unless (item.name.downcase.include? keyword) || (item.descrip.downcase.include? keyword)
          options << item
        end
      end
    end
    options.sample
  end


end