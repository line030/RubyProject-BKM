class ExercisesController < ApplicationController

  before_filter :authenticate

  # GET /exercises
  # GET /exercises.json
  def index
    @exercisesGlobal = Exercise.find_all_by_is_global(true)
    @exercisesByUser = Exercise.find_all_by_user_id(current_user.id)

    unitGlobal = @exercisesGlobal.collect { | e |
      e.unit ? [e.id, e.unit.name] : [e.id, "no Unit specified"]
    }
    @unitGlobal = Hash[*(unitGlobal.flatten)]

    unitByUser = @exercisesByUser.collect { | e |
      e.unit ? [e.id, e.unit.name] : [e.id, "no Unit specified"]
    }
    @unitByUser = Hash[*(unitByUser.flatten)]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercisesGlobal }
    end
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = Exercise.find(params[:id])
    @unit = @exercise.unit

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/new
  # GET /exercises/new.json
  def new
    @exercise = Exercise.new
    assign_unit_selection_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise }
    end
  end

  def assign_unit_selection_list

    @unit_selection_list = Unit.all.collect {|unit| [ unit.name, unit.id ] }
  end

  # GET /exercises/1/edit
  def edit
    @exercise = Exercise.find(params[:id])
    assign_unit_selection_list
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(params[:exercise])
    @exercise.user_id = current_user.id

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Exercise was successfully created.' }
        format.json { render json: @exercise, status: :created, location: @exercise }
      else
        format.html { render action: "new" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exercises/1
  # PUT /exercises/1.json
  def update
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      if @exercise.update_attributes(params[:exercise])
        format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to exercises_url }
      format.json { head :no_content }
    end
  end
end
