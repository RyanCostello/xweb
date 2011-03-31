#Controls a player's inventory

class PlayerInventoriesController < ApplicationController
  # GET /player_inventories
  # GET /player_inventories.xml
  def index
    @player_inventories = PlayerInventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @player_inventories }
    end
  end
  
  #adds an item to a players inventory
  def addItem
    @remove_item = PlayerInventory.find(:first, :conditions => ["inventory_id = ? and player_id = ?", params[:oldId], session[:p_id]])
    @remove_item.destroy
    @player_inventory = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => params[:id])
    
    respond_to do |format|
      if @player_inventory.save
        format.html { redirect_to(player_inventories_url, :notice => 'Player inventory was successfully created.') }
        format.xml  { render :xml => @player_inventory, :status => :created, :location => @player_inventory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player_inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /player_inventories/1
  # GET /player_inventories/1.xml
  def show
    @player_inventory = PlayerInventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player_inventory }
    end
  end

  # GET /player_inventories/new
  # GET /player_inventories/new.xml
  def new
    @player_inventory = PlayerInventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player_inventory }
    end
  end

  # GET /player_inventories/1/edit
  def edit
    @player_inventory = PlayerInventory.find(params[:id])
  end

  # POST /player_inventories
  # POST /player_inventories.xml
  def create
    @player_inventory = PlayerInventory.new(params[:player_inventory])

    respond_to do |format|
      if @player_inventory.save
        format.html { redirect_to(@player_inventory, :notice => 'Player inventory was successfully created.') }
        format.xml  { render :xml => @player_inventory, :status => :created, :location => @player_inventory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player_inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /player_inventories/1
  # PUT /player_inventories/1.xml
  def update
    @player_inventory = PlayerInventory.find(params[:id])

    respond_to do |format|
      if @player_inventory.update_attributes(params[:player_inventory])
        format.html { redirect_to(@player_inventory, :notice => 'Player inventory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player_inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /player_inventories/1
  # DELETE /player_inventories/1.xml
  def destroy
    @player_inventory = PlayerInventory.find(params[:id])
    @player_inventory.destroy

    respond_to do |format|
      format.html { redirect_to(player_inventories_url) }
      format.xml  { head :ok }
    end
  end
end
