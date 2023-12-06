ActiveAdmin.register Master::ProductName, as: 'Product Name' do
  
permit_params :product_l1_category_id, :product_l2_category_id, :product_l3_category_id,
    :product_name, :unit_of_measurement_id

    
    index do
    selectable_column
    id_column
    column :product_l1_category do |obj|
        department = Master::ProductL1Category.find_by(id: obj.product_l1_category_id)
        department&.l1_category_name
    end
    column 'l1_category_image' do |model|
        if model.product_l1_category&.l1_category_image&.file.present?
          span do
            image_tag model.product_l1_category.l1_category_image.url, height: '50px', alt: 'Image'
          end
        else
          # Handle the case when l1_category_image is nil or not present
          'N/A'
        end
      end
    column :product_l2_category do |obj|
        department = Master::ProductL2Category.find_by(id: obj.product_l2_category_id)
        department&.l2_category_name
    end
    column 'l2_category_image' do |model|
        if model.product_l2_category&.l2_category_image&.file.present?
          span do
            image_tag model.product_l2_category.l2_category_image.url, height: '50px', alt: 'Image'
          end
        else
          # Handle the case when l1_category_image is nil or not present
          'N/A'
        end
      end
    
    column :product_l3_category do |obj|
        department = Master::ProductL3Category.find_by(id: obj.product_l3_category_id)
        department&.l3_category_name
    end
    column 'l3_category_image' do |model|
        if model.product_l3_category&.l3_category_image&.file.present?
          span do
            image_tag model.product_l3_category.l3_category_image.url, height: '50px', alt: 'Image'
          end
        else
          # Handle the case when l1_category_image is nil or not present
          'N/A'
        end
      end
    
    column :product_name

    column :product_l1_category do |obj|
        department = Master::UnitOfMeasurement.find_by(id: obj.unit_of_measurement_id)
        department&.uom_name
    end
    
    actions
    end

    form do |f|
    f.inputs 'Product Name Details' do

    f.input :product_l1_category, as: :select, collection: Master::ProductL1Category.all.map { |c| [c.l1_category_name, c.id] }
    f.input :product_l2_category, as: :select, collection: Master::ProductL2Category.all.map { |c| [c.l2_category_name, c.id] }
    f.input :product_l2_category, as: :select, collection: Master::ProductL3Category.all.map { |c| [c.l3_category_name, c.id] }
    f.input :product_name
    f.input :unit_of_measurement, as: :select, collection: Master::UnitOfMeasurement.all.map { |c| [c.uom_name, c.id] }
    end
    f.actions
    end
end