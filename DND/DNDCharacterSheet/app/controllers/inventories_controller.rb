#Controls the master inventory

class InventoriesController < ApplicationController
  # GET /inventories
  # GET /inventories.xml
  def index
    @inventories = Inventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inventories }
    end
  end
  
  def list
    @slot = params[:slot]
    @id = params[:id]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slot }
    end
  end

  # GET /inventories/1
  # GET /inventories/1.xml
  def show
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inventory }
    end
  end

  # GET /inventories/new
  # GET /inventories/new.xml
  def new
    @inventory = Inventory.new
    @slot = params[:slot]
    @item_type = params[:item_type]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inventory }
    end
  end

  # GET /inventories/1/edit
  def edit
    @inventory = Inventory.find(params[:id])
    @item_type = @inventory.item_type
    @slot = @inventory.slot
  end

  # POST /inventories
  # POST /inventories.xml
  def create
    @inventory = Inventory.new(params[:inventory])

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to(inventories_url, :notice => 'Inventory was successfully created.') }
        format.xml  { render :xml => @inventory, :status => :created, :location => @inventory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inventories/1
  # PUT /inventories/1.xml
  def update
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      if @inventory.update_attributes(params[:inventory])
        format.html { redirect_to(inventories_url, :notice => 'Inventory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(edit_inventory_path(@inventory.id), :notice => 'Entries cannot be blank.') }
        format.xml  { render :xml => @inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.xml
  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to(inventories_url) }
      format.xml  { head :ok }
    end
  end
end
