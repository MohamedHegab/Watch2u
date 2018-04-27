json.extract! order, :id, :number, :status, :sub_total, :total_price, :created_at, :updated_at

json.customer do
	json.id order.customer.id
	json.username order.customer.username
	json.email order.customer.email
	json.code order.customer.code
	json.mobile order.customer.mobile
	json.gender order.customer.gender.value if order.customer.gender
	json.region order.customer.region if order.customer.region
end

json.payment order.payment

json.products do
  json.array! order.order_products.includes(:product) do |order_product|
  	json.id order_product.product_id
  	json.quantity order_product.quantity
  	json.price order_product.price
  	json.discount order_product.product.discount
  end
end
