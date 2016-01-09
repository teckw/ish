class ItemsController < ApplicationController

    def create
        @user = User.find(session[:user_id])
        @item = Item.new
    end

    def new
        user = User.find_by(id: session[:user_id])
        location = user.location
        @item = Item.new(item_params)
        @item.user_id = params[:user_id]
        @item.location_id = params[:location_id]
        if @item.save
            redirect_to controller: 'users', action: 'main'
        else
            redirect_to controller: 'items', action: 'create'
        end
    end

    def like
        user = User.find_by(id: session[:user_id])
        item = Item.find(params[:id])
        like = Like.create(user: user, item: item)
        redirect_to '/items/show'
    end

    def unlike
        user = User.find_by(id: session[:user_id])
        item = Item.find(params[:id])
        if item.blank? == false
            item.destroy
            redirect_to '/items/show'
        else
            redirect_to '/items/show'
        end
    end

    def show
       @user = User.find(session[:user_id])
       @items = Item.all
       # @ids = Item.pluck(:id).shuffle[0..0]
       @random_items = Item.where("location_id = :location_id AND user_id != :user_id", {location_id: Location.find(@user.location.id), user_id: User.find(@user.id)})
       # @random_items = Item.where(location: Location.find(14))
       # @all_items = Item.all
       random_item_id = []    # [35, 43]

       @random_items.each do |item|
           random_item_id.push(item.id)
       end
       # @x = random_item_id
       # # new_random_number = random[0...random_item_id.length]
       # #                     random[0..2]
       # @items_list = random_item_id
       x = random_item_id.sample
       @ritem = Item.find(x)
       # puts x
       # pluck and ID
       # set new instance variable
       # @item = Item.find(x)
   end

    def update
        user = User.find_by(id: session[:user_id])
        item = Item.find(params[:id])
        location = user.location
        item.update_attribute(:name, params[:name])
        item.update_attribute(:price, params[:price])
        item.update_attribute(:description, params[:description])
        item.update_attribute(:user, user)
        item.update_attribute(:location, location)
        redirect_to '/users'
    end

    def delete
        item = Item.find(params[:id])
        item.destroy
        redirect_to '/users'
    end

    private
    def item_params
        params.require(:item).permit(:name, :price, :description, :ipic)
    end
end