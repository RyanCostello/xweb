class PlayersController < ApplicationController
  # GET /players
  # GET /players.xml
  def index
    @players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @players }
    end
  end
  
  # GET /players/1
  # GET /players/1.xml
  def show
    @player = Player.find(params[:id])
    
    session[:p_id] = @player.id
    session[:str_mod] = (@player.strength-10)/2
    session[:con_mod] = (@player.constitution-10)/2
    session[:dex_mod] = (@player.dexterity-10)/2
    session[:int_mod] = (@player.intellect-10)/2
    session[:wis_mod] = (@player.wisdom-10)/2
    session[:char_mod] = (@player.charisma-10)/2
    
    session[:ac] = 0
    session[:ref] = 0
    session[:will] = 0
    session[:fort] = 0
    
    @item = PlayerInventory.find(:first, :conditions => ["player_id = ?", session[:p_id]])
    
    if !@item
      @item = Inventory.find(:first, :conditions => ["name = ?", "Hat"])    
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
      @item = Inventory.find(:first, :conditions => ["name = ?", "Fist"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
      @item = Inventory.find(:first, :conditions => ["name = ?", "T-Shirt"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
      @item = Inventory.find(:first, :conditions => ["name = ?", "Jeans"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
      @item = Inventory.find(:first, :conditions => ["name = ?", "Neck Tie"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
      @item = Inventory.find(:first, :conditions => ["name = ?", "Shoes"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
      @item = Inventory.find(:first, :conditions => ["name = ?", "String"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
      @item = Inventory.find(:first, :conditions => ["name = ?", "Arm"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
      @item = Inventory.find(:first, :conditions => ["name = ?", "Mittens"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
    end
    
    @def = PlayerInventory.find(:all, :conditions => ["player_id = ?", session[:p_id]])    
    
    @def.each do |defen|
      @addValue = Inventory.find(:first, :conditions => ["id = ?", defen.inventory_id])
      if @addValue.item_type == "Armor"
        session[:ac] += @addValue.bAC
        session[:ref] += @addValue.bReflex
        session[:will] += @addValue.bWill
        session[:fort] += @addValue.bFort
      end
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/new
  # GET /players/new.xml
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.xml
  def create
    @player = Player.new(params[:player])
    

    respond_to do |format|
      if @player.save
        format.html { redirect_to(@player, :notice => 'Player was successfully created.') }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    @player = Player.find(params[:id])
    
    @defense = Defense.find(:first, :condition => "player_id = '#{session[:p_id]}'")
    @skill = Skill.find(:first, :condition => "player_id = '#{session[:p_id]}'")
    @defense.destroy
    @skill.destroy

    respond_to do |format|
      if @player.update_attributes(params[:player])
        session[:str_mod] = (@player.strength-10)/2
        session[:con_mod] = (@player.constitution-10)/2
        session[:dex_mod] = (@player.dexterity-10)/2
        session[:int_mod] = (@player.intellect-10)/2
        session[:wis_mod] = (@player.wisdom-10)/2
        session[:char_mod] = (@player.charisma-10)/2
        format.html { redirect_to(@player, :notice => 'Player was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def calculateSkill
    
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(players_url) }
      format.xml  { head :ok }
    end
  end
end
