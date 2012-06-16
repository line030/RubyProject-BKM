ActiveAdmin.register WorkoutDay do

  index do
    column "ID", :id  do  |post|
      link_to post.id, admin_workout_day_path(post)
    end
    column :day
    column :created_at
    column :updated_at
    column :is_global
    #column "Excersises" do |post|
    #  link_to "Id: " + post.address_id.to_s, admin_address_path(post.address)
    #  end
    # View, Edit, Delete
    default_actions

    puts "ALLE EXCERSISES VOM USER"
    @exercises_selection_list = Exercise.find_all_by_user_id(12).collect { |exercise|
      [exercise.name, exercise.id]
    }
    @exercises_selection_list.each do  |post|

      puts post[0]

    end

    puts "ALLE EXCERSISES GLOBAL"
    @global_exercises_selection_list = Exercise.find_all_by_is_global(true).collect { |exercise|
      [exercise.name, exercise.id]
    }

    @global_exercises_selection_list.each do  |post|

      puts post[0]

    end


  end





  #exercises_selection_list

  #exercises_selection_list.each do |e|

  #link_to e.name, e

  #end


end
