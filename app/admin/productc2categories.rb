ActiveAdmin.register Master::ProductL2Category, as: 'Product L2 Category' do
    
    permit_params :product_l1_category_id, :l2_category_name, :l2_category_image
     
    menu priority: 6, label: 'Product L2 Category', parent: 'Categories'
    
    index do
        selectable_column
        id_column
        column :l2_category_name
        column :product_l1_category do |product_l3_category|
              product_l3_category.product_l1_category.l1_category_name if product_l3_category.product_l1_category
        end
        column 'l2_category_image' do |model|
             if model.l2_category_image.present?
               span do
                 image_tag model.l2_category_image.url, height: '50px', alt: 'Image'
               end
             else
               span 'No Image'
             end
           end
        actions
      end

    form do |f|
        f.inputs 'Product L2 Category Details' do
            f.input :product_l1_category_id, as: :select, collection: Master::ProductL1Category.all.map { |c| [c.l1_category_name, c.id] }
          f.input :l2_category_name
          f.input :l2_category_image, as: :file
        end
        f.actions
      end
  end