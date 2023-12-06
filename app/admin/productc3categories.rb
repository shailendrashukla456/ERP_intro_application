ActiveAdmin.register Master::ProductL3Category, as: 'Product L3 Category' do
    
    permit_params :product_l1_category_id, :product_l2_category_id, :l3_category_name, :l3_category_image
    
    menu priority: 6, label: 'Product L3 Category', parent: 'Categories'
    
    index do
        selectable_column
        id_column
        column :product_l1_category do |product_l3_category|
          product_l3_category.product_l1_category.l1_category_name if product_l3_category.product_l1_category
        end
        column :product_l2_category do |product_l3_category|
          product_l3_category.product_l2_category.l2_category_name if product_l3_category.product_l2_category
        end
        column :l3_category_name

        column 'l3_category_image' do |product_l3_category|
           if product_l3_category.l3_category_image.file.present?
              span do
                image_tag product_l3_category.l3_category_image.url, height: '50px', alt: 'Image'
              end
            else
              span 'No Image'
            end        
          end
    end


     form do |f|
        f.inputs 'Product L3 Category Details' do
        f.input :product_l1_category_id, as: :select, collection: Master::ProductL1Category.all.map { |c| [c.l1_category_name, c.id] }
        f.input :product_l2_category_id, as: :select, collection: Master::ProductL2Category.all.map { |c| [c.l2_category_name, c.id] }
        f.input :l3_category_name
        f.input :l3_category_image, as: :file
        end
        f.actions
      end
     
   
  end