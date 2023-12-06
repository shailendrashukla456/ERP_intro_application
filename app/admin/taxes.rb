ActiveAdmin.register Master::Tax, as: 'Tax' do
    permit_params :tax_name
  
    index do
      selectable_column
      id_column
      column :tax_name
      actions
    end
  
    form do |f|
      f.inputs 'Tax Details' do
        f.input :tax_name
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :id
        row :tax_name
        # Add more rows for additional attributes
      end
    end
  
    filter :tax_name
  
    # Other configurations...
  
  end