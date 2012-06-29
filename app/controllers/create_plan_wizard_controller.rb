  class CreatePlanWizardController < Wicked::WizardController

    #before_filter :authenticate

    steps :add_plan, :add_day, :add_exercise
    # ....

    def show

      case step
        when :add_plan
            @workout_plan = WorkoutPlan.new

      end

      case step
        when :add_day
        @workout_plan = WorkoutPlan.find_last_by_user_id(current_user.id)
        @workout_day = WorkoutDay.new
        assign_workout_selection_lists  @workout_plan.id

      end

      case step
        when :add_exercise

          @workout_plan = WorkoutPlan.find_last_by_user_id(current_user.id)
          @workout_days = @workout_plan.workout_days
          @exercise = Exercise.new

          assign_exercises_selection_list @workout_plan.id
          assign_unit_selection_list
      end

      render_wizard
    end

    def update
      case step
        when :add_plan
          if params[:workout_plan][:name].blank?
            redirect_to wizard_path(:add_plan)
          else
            @workout_plan = WorkoutPlan.create!
            @workout_plan.name = params[:workout_plan][:name]
            @workout_plan.user_id = current_user.id

            @workout_plan.save!
            render_wizard @workout_plan
          end


      end

      case step
        when :add_day

          #render :text => params[:workout_plan_id], :layout => false
          #return
          if params[:workout_day][:day].blank?

          else
          @workout_day = WorkoutDay.create!
          @workout_day.day = params[:workout_day][:day].to_s
          @workout_day.workout_plan_id = params[:workout_day][:workout_plan_id]
          @workout_day.user_id = current_user.id
          @workout_day.save!
          end
          redirect_to wizard_path(:add_day)
      end

      case step
        when :add_exercise

          @workout_day = WorkoutDay.find_by_id(params[:exercise][:workout_day_id])

          if params[:exercise][:name].blank?

          else
          @exercise = Exercise.create!
          @exercise.name = params[:exercise][:name]
          @exercise.picture = params[:exercise][:picture]
          @exercise.description = params[:exercise][:description]
          @exercise.points = params[:exercise][:points]
          @exercise.unit_id = params[:exercise][:unit_id]
          @exercise.user_id = current_user.id
          @exercise.save!

          @workout_day.exercises << @exercise
          @workout_day.save!

          end
          redirect_to wizard_path(:add_exercise)

    end
  end
 #------------------------------------------------------------------------------
    def assign_exercises_selection_list  (plan_id)
      @global_exercises_selection_list = Exercise.find_all_by_is_global(true).collect { |exercise|
        [exercise.name, exercise.id]
      }

      exercises_selection_list = Exercise.find_all_by_user_id(current_user.id)
      list = Array.new

      exercises_selection_list.each do |ex|

        ex.workout_days.each do |day|

          if day.workout_plan_id != plan_id
               list << ex
            end

        end

      end

      @exercises_selection_list = list.collect {|exercise| [exercise.name, exercise.id]}

    end

    def assign_workout_selection_lists (plan_id)

      @global_workout_day_selection_list = WorkoutDay.find_all_by_is_global(true).collect {|work| [ work.day, work.id ] }

      workout_day_selection_list = WorkoutDay.find_all_by_user_id(current_user.id)

      list = Array.new

      workout_day_selection_list.each do |day|
        if day.workout_plan_id != plan_id
          list << day
        end
      end
      @workout_day_selection_list = list.collect {|work| [ work.day, work.id ] }

    end

    def add_new_day
      # zum speichern des neuen Trainingstages

      @workout_day = WorkoutDay.find_by_id(params[:workout_day][:id])

      if  @workout_day.nil?
        #do nuthin

      else

      @copy = WorkoutDay.new(:day => @workout_day.day + " [copy]", :workout_plan_id => params[:workout_plan_id])
      @copy.user_id = current_user.id

      @workout_day.exercises.each do |ex|
        exercise = Exercise.create(:name => ex.name + "[copy]",
                                   :description => ex.description,
                                   :picture => ex.picture,
                                   :points => ex.points ,
                                   :unit_id => ex.unit_id)
        @copy.exercises << exercise
        @copy.user_id = current_user.id
      end
        @copy.save!
      end
      redirect_to wizard_path(:add_day)
    end

    def add_new_exercise

      # zum speichern des neuen Trainingstages

      @exercise = Exercise.find_by_id(params[:exercise][:id])


      #render :text => @exercise.description, :layout => false
      #return

      if  @exercise.nil?
        #do nuthin

      else

        #render :text => params[:workout_day_id], :layout => false
        #return

        @copy = Exercise.create(:name => @exercise.name + " [copy]",
                                :description => @exercise.description ,
                                :picture => @exercise.picture,
                                :points => @exercise.points ,
                                :unit_id => @exercise.unit_id)
        @copy.user_id = current_user.id

        @copy.workout_days << WorkoutDay.find_by_id(params[:workout_day_id])

        @copy.save!
      end

    redirect_to wizard_path(:add_exercise)

    end

    def assign_unit_selection_list
      @unit_selection_list = Unit.all.collect {|unit| [ unit.name, unit.id ] }
    end

  end
