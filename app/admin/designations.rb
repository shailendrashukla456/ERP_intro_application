ActiveAdmin.register Master::Designation, as: 'Designation' do
    
    permit_params :designation, :department_id
  
    index do
        selectable_column
        id_column
        column :designation
        column :department do |obj|
            department = Master::Department.find_by(id: obj.department_id)
            department&.department_name
        end
        actions
      end
    
      form do |f|
        f.inputs 'Designation Details' do
          f.input :designation
          f.input :department, as: :select, collection: Master::Department.all.map { |c| [c.department_name, c.id] }
        end
        f.actions
      end

  end