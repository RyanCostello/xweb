class DefensesController < ApplicationController
  # GET /defenses
  # GET /defenses.xml
  def index
    @defenses = Defense.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @defenses }
    end
  end

  # GET /defenses/1
  # GET /defenses/1.xml
  def show
    @defense = Defense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @defense }
    end
  end

  # GET /defenses/new
  # GET /defenses/new.xml
  def new
    @defense = Defense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @defense }
    end
  end

  # GET /defenses/1/edit
  def edit
    @defense = Defense.find(params[:id])
  end

  # POST /defenses
  # POST /defenses.xml
  def create
    @defense = Defense.new(params[:defense])

    respond_to do |format|
      if @defense.save
        format.html { redirect_to(@defense, :notice => 'Defense was successfully created.') }
        format.xml  { render :xml => @defense, :status => :created, :location => @defense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @defense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /defenses/1
  # PUT /defenses/1.xml
  def update
    @defense = Defense.find(params[:id])

    respond_to do |format|
      if @defense.update_attributes(params[:defense])
        format.html { redirect_to(@defense, :notice => 'Defense was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @defense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /defenses/1
  # DELETE /defenses/1.xml
  def destroy
    @defense = Defense.find(params[:id])
    @defense.destroy

    respond_to do |format|
      format.html { redirect_to(defenses_url) }
      format.xml  { head :ok }
    end
  end
end
