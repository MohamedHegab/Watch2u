json.extract! order, :id, :number, :status, :sub_total, :total_price, :created_at, :updated_at

json.customer order.customer
json.payment order.payment

json.products do
  json.array! order.order_products.includes(:product) do |order_product|
  	json.id order_product.product_id
  	json.quantity order_product.quantity
  	json.price order_product.price
  	json.discount order_product.product.discount
  end
end
