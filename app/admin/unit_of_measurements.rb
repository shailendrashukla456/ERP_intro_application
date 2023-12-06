ActiveAdmin.register Master::UnitOfMeasurement, as: 'Unit of measurements' do
    
    permit_params :uom_name
  
    index do
        selectable_column
        id_column  uom_name
        actions
      end
    
      form do |f|
        f.inputs 'Unit of measurements Details' do
          f.input :uom_name
        end
        f.actions
      end
end