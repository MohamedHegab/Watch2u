ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  actions  :index, :edit, :show, :update
  
  permit_params :customer_id, :payment_id, :status, :sub_total, :number, :total_price, :order_products_attributes => [:product_id, :quantity, :price, :discount, :id, :_destroy]
  
  show do |order|
    attributes_table do
      row :number
      row :status
      row :customer_id do
        link_to order.customer.username, admin_user_path(order.customer_id)
      end
      row :sub_total
      row :total_price
      row :payment_id
    end

    panel "Order Products"  , only: [:show, :edit]  do
      table_for order.order_products do
        column :product_id do |p|
          link_to p.product.name, admin_product_path(p.product)
        end
        column :price
        column :quantity
        column :discount do |p|
          p.product.discount
        end
        column :new_price do |p|
          p.product.new_price.round(3)
        end
        column :total_price do |p|
          p.q_p_cost.round(3)
        end
      end
    end
  end


  index do
    selectable_column

    column :number
    column :status
    column :customer_id
    column :sub_total
    column :total_price

    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs 'Details' do
      f.input :customer_id, as: :select, collection: User.all.collect {|user| [user.username, user.id] }
      f.input :payment_id, as: :select, collection: Payment.all.collect {|payment| [payment.username, payment.id] }
      f.input :status
      f.input :sub_total, input_html: { readonly: true, disabled: true  }
      f.input :number, input_html: { readonly: true, disabled: true  }
      f.input :total_price, input_html: { readonly: true, disabled: true  }
    end

    f.has_many :order_products do |order_product|
      if order_product.object.product
        order_product.object.discount = order_product.object.product.discount
        order_product.object.new_price = order_product.object.product.new_price
        order_product.object.total_price = order_product.object.q_p_cost
      end
      order_product.inputs "Order Product" do
        order_product.input :product_id, as: :select, collection: Product.all.collect {|product| [product.name, product.id] }, input_html: {class: 'product_field', 'data-option-url' => '/api/v1/products/:order_product_id'}
        order_product.input :quantity, input_html: { type: :number, class: 'quantity_field'  }
        order_product.input :price, input_html: { readonly: true, disabled: true, class: 'price_field'  }
        order_product.input :discount, input_html: { type: :number,readonly: true, disabled: true, class: 'discount_field' }
        order_product.input :new_price, input_html: { type: :number, readonly: true, disabled: true, class: 'new_price_field'  }
        order_product.input :total_price, input_html: { type: :number, readonly: true, disabled: true, class: 'total_price_field'  }
      
      end
    end

    f.actions
  end
end