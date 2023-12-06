ActiveAdmin.register Master::ProductL1Category, as: 'Product L1 Category' do
    
    permit_params :l1_category_name, :l1_category_image
     
    menu priority: 6, label: 'Product L1 Category', parent: 'Categories'
    
    index do
        selectable_column
        id_column
        column :l1_category_name
        column 'l1_category_image' do |model|
          if model.l1_category_image.file.present?
            span do
              image_tag model.l1_category_image.url, height: '50px', alt: 'Image'
            end
          else
            span 'No Image'
          end
        end
        actions
      end

      form do |f|
        f.inputs 'Product L1 Category Details' do
          f.input :l1_category_name
          f.input :l1_category_image, as: :file
        end
        f.actions
      end
  end