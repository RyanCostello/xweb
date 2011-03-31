#PlayerSpells bring together the Player and Spells table.

class PlayerSpellsController < ApplicationController
  # GET /player_spells
  # GET /player_spells.xml
  def index
    @player_spells = PlayerSpell.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @player_spells }
    end
  end

  # GET /player_spells/1
  # GET /player_spells/1.xml
  def show
    @player_spell = PlayerSpell.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player_spell }
    end
  end

  # GET /player_spells/new
  # GET /player_spells/new.xml
  def new
    @player_spell = PlayerSpell.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player_spell }
    end
  end

  # GET /player_spells/1/edit
  def edit
    @player_spell = PlayerSpell.find(params[:id])
  end
  
  #Redirects the user to the spellbook list instead of show
  def addSpell
    @player_spell = PlayerSpell.new(:player_id => session[:p_id], :spell_id => params[:id])
    
    respond_to do |format|
      if @player_spell.save
        format.html { redirect_to(player_spells_url, :notice => 'Player spell was successfully created.') }
        format.xml  { render :xml => @player_spell, :status => :created, :location => @player_spell }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player_spell.errors, :status => :unprocessable_entity }
      end
    end
  end

  # POST /player_spells
  # POST /player_spells.xml
  def create
    @player_spell = PlayerSpell.new(params[:player_spell])

    respond_to do |format|
      if @player_spell.save
        format.html { redirect_to(@player_spell, :notice => 'Player spell was successfully created.') }
        format.xml  { render :xml => @player_spell, :status => :created, :location => @player_spell }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player_spell.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /player_spells/1
  # PUT /player_spells/1.xml
  def update
    @player_spell = PlayerSpell.find(params[:id])

    respond_to do |format|
      if @player_spell.update_attributes(params[:player_spell])
        format.html { redirect_to(@player_spell, :notice => 'Player spell was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player_spell.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /player_spells/1
  # DELETE /player_spells/1.xml
  def destroy
    @player_spell = PlayerSpell.find(params[:id])
    @player_spell.destroy

    respond_to do |format|
      format.html { redirect_to(player_spells_url) }
      format.xml  { head :ok }
    end
  end
end
