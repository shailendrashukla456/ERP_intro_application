ActiveAdmin.register Master::UserProfile, as: 'user_profile' do
    
    permit_params :name, :department_id, :designation_id, :address, :city, :state, :email, :phone1, :phone2, :blood_group, :aadhar_card, :driving_license_number, :father_name, :mother_name, :emergency_contact_person, :emergency_contact_person_mobile, :upload_photo
  

    index do
        selectable_column
        id_column
        column :name
        column :department do |obj|
            department = Master::Department.find_by(id: obj.department_id)
            department&.department_name
        end
        column :designation do |obj|
            designation = Master::Designation.find_by(id: obj.designation_id)
            designation&.designation
        end
        column :address
        column :city
        column :state
        column :email
        column :phone1
        column :phone2
        column :blood_group
        column :aadhar_card
        column :driving_license_number
        column :father_name
        column :mother_name
        column :emergency_contact_person
        column :emergency_contact_person_mobile
        column 'upload_photo' do |user_profile|
            if user_profile.upload_photo.file.present?
               span do
                 image_tag user_profile.upload_photo.url, height: '50px', alt: 'Image'
               end
             else
               span 'No Image'
             end        
           end
        actions
      end

    form do |f|
      f.inputs 'User Profile Details' do
        f.input :name
        f.input :department, as: :select, collection: Master::Department.all.map { |c| [c.department_name, c.id] }
        f.input :designation, as: :select, collection: Master::Designation.all.map { |c| [c.designation, c.id] }
        f.input :address
        f.input :city
        f.input :state
        f.input :email
        f.input :phone1
        f.input :phone2
        f.input :blood_group
        f.input :aadhar_card
        f.input :driving_license_number
        f.input :father_name
        f.input :mother_name
        f.input :emergency_contact_person
        f.input :emergency_contact_person_mobile
        f.input :upload_photo, as: :file
      end
      f.actions
    end
  
    
  end