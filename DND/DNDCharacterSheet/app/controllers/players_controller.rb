class PlayersController < ApplicationController
  # GET /players
  # GET /players.xml
  def index
    @players = Player.all

    session[:health_track] = 0

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @players }
    end
  end
  
  def changehealth
    @player = Player.find(session[:p_id])
    @dec = params[:health_down]
    @inc = params[:health_up]
    
    if @dec != ""
      @dec = Integer(@dec)
      session[:health] -= @dec   
    end
    
    if @inc != ""
      @inc = Integer(@inc)
      session[:health] += @inc
    end
    
   
    redirect_to(@player)
    
  end
  
  # GET /players/1
  # GET /players/1.xml
  def show    
    @player = Player.find(params[:id])
    
    if session[:health_track] == 0
      session[:health] = @player.health + @player.health_per_level * @player.character_level
      session[:health_track] = 1
    end
    
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
    
    @helm = false
    @weapon1 = false
    @weapon2 = false
    @amulet = false
    @chest = false
    @boots = false
    @ring = false
    @gloves = false
    @shield = false  
    @legs = false
    
    @player_items = PlayerInventory.find(:all, :conditions => ["player_id = ?", session[:p_id]])
    
    @player_items.each do |items|
      @item = Inventory.find(:first, :conditions => ["id = ?", items.inventory_id])
      if @item.slot == "Helm"
        @helm = true
      elsif @item.slot == "1 Handed"
        @weapon1 = true
      elsif @item.slot == "2 Handed"
        @weapon2 = true
      elsif @item.slot == "Amulet"
        @amulet = true
      elsif @item.slot == "Chest"
        @chest = true
      elsif @item.slot == "Legs"
        @legs = true
      elsif @item.slot == "Ring"
        @ring = true
      elsif @item.slot == "Boots"
        @boots = true
      elsif @item.slot == "Gloves"
        @gloves = true
      elsif @item.slot == "Shield"
        @shield = true
      end
    end
    
    if @helm == false
      @item = Inventory.find(:first, :conditions => ["name = ?", "Hat"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
    end
    if @weapon1 == false and @weapon2 == false
      @item = Inventory.find(:first, :conditions => ["name = ?", "Fist"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
    end
    if @chest == false
      @item = Inventory.find(:first, :conditions => ["name = ?", "T-Shirt"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
    end
    if @legs == false
      @item = Inventory.find(:first, :conditions => ["name = ?", "Jeans"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
    end
    if @amulet == false
      @item = Inventory.find(:first, :conditions => ["name = ?", "Neck Tie"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
    end
    if @boots == false
      @item = Inventory.find(:first, :conditions => ["name = ?", "Shoes"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
    end
    if @ring == false
      @item = Inventory.find(:first, :conditions => ["name = ?", "String"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
    end
    if @shield == false
      @item = Inventory.find(:first, :conditions => ["name = ?", "Arm"])
      foo = PlayerInventory.new(:player_id => session[:p_id], :inventory_id => @item.id)
      foo.save
    end
    if @gloves == false
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
    
    @defense = Defense.find(:first, :conditions => "player_id = '#{session[:p_id]}'")
    @skill = Skill.find(:first, :conditions => "player_id = '#{session[:p_id]}'")
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


def add_point
    @something = Player.find(:first, :conditions => ["id = ?", session[:p_id]])
    @something.increment!(:character_level)
    redirect_to(@something)
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
