json.extract! order, :id, :number, :sub_total, :total_price, :created_at, :updated_at

json.status Order.statuses[order.status]

if current_user.has_role? :admin
	json.customer do
		json.id order.customer.id
		json.username order.customer.username
		json.email order.customer.email
		json.code order.customer.code
		json.mobile order.customer.mobile
		json.gender order.customer.gender.value if order.customer.gender
		json.region order.customer.region if order.customer.region
	end
end

json.payment order.payment
json.shipping order.shipping
json.address order.address

json.order_products do
  json.array! order.order_products.includes(:product) do |order_product|
  	json.id order_product.id
  	json.product order_product.product
  	json.quantity order_product.quantity
  	json.price order_product.price
  	json.discount order_product.product.discount
  	json.total_price order_product.q_p_cost
  end
end
