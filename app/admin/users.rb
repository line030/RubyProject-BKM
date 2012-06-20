ActiveAdmin.register User do
  index do
    column :id do  |post|
      link_to post.id, admin_user_path(post)
    end
    column :login
    column :forename
    column :surname
    column :email
    column :gender
    column :last_login_at
    column :enabled
    column "Address" do |post|
      link_to "Id: " + post.address_id.to_s, admin_address_path(post.address)
    end
    # View, Edit, Delete
    default_actions
   end

    form do |f|
        f.inputs "Admin Details" do
          f.input :login
          f.input :forename
          f.input :surname
          f.input :password
          f.input :password_confirmation
          f.input :email
          f.input :gender, :as => :radio, :collection => [["Male","male"], ["Female","female"]]
          f.input :date_of_birth
          f.input :enabled
          #eine leere Addresse dem neuen User hinzufügen
          @address = Address.create
          f.input :address_id, :as => :hidden, :value  => @address.id
        end

        #nur fürs edit
        if !f.object.id.nil?
          f.inputs "Address" do
            f.semantic_fields_for user.address do |p|
              p.label :name, link_to(user.address.name, admin_address_path(user.address_id))
            end
          end
        else
        end
    f.buttons
  end



end
