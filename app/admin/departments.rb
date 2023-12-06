ActiveAdmin.register Master::Department, as: 'Department' do
    
    permit_params :department_name
  
    index do
        selectable_column
        id_column
        column :department_name
        actions
      end
    
      form do |f|
        f.inputs 'Department Details' do
          f.input :department_name
        end
        f.actions
      end
end