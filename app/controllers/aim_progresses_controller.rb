class AimProgressesController < ApplicationController

  def index
    @aim_progresses = AimProgress.all

    aim = @aim_progresses.collect { | e |
      e.aim ? [e.id, e.aim.name] : [e.id, "no Aim specified"]
    }
    @aims = Hash[*(aim.flatten)]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aim_progresses }
    end
  end

  def show
    @aim_progress = AimProgress.find(params[:id])
    @aim = @aim_progress.aim

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aim_progress }
    end
  end

  def new
    @aim_progress = AimProgress.new

    assign_aim_selection_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aim_progress }
    end
  end

    # GET /aim_progresses/1/edit
  def edit
    @aim_progress = AimProgress.find(params[:id])
    assign_aim_selection_list
  end

  def assign_aim_selection_list

    @aim_selection_list = Aim.all.collect {|aim| [ aim.name, aim.id ] }
  end

  # POST /aim_progresses
  # POST /@aim_progresses.json
  def create

    @aim_progress = AimProgress.new(params[:aim_progresses])

    respond_to do |format|
      if @aim_progress.save
        format.html { redirect_to @aim_progress, notice: 'AimProgress was successfully created.' }
        format.json { render json: @aim_progress, status: :created, location: @aim_progress }
      else
        format.html { render action: "new" }
        format.json { render json: @aim_progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aim_progresses/1
  # PUT /aim_progresses/1.json
  def update
    @aim_progress = AimProgress.find(params[:id])

    respond_to do |format|
      if @aim_progress  .update_attributes(params[:aim_progress])
        format.html { redirect_to @aim_progress, notice: 'AimProgress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aim_progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aim_progresses/1
  # DELETE /aim_progresses/1.json
  def destroy
    @aim_progress = AimProgress.find(params[:id])
    @aim_progress.destroy

    respond_to do |format|
      format.html { redirect_to aim_progresses_url }
      format.json { head :no_content }
    end
  end

end
