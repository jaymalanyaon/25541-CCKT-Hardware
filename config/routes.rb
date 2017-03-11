Rails.application.routes.draw do

# HOMEPAGE
  get 'home' => 'home#index'

# CLERK
  get 'clerks' => 'clerks#index'
  get 'clerks/newclerk' => 'clerks#newclerk'
  post 'clerks' => 'clerks#add_clerk'
  get 'clerks/:id/edit' => 'clerks#edit'
  patch 'clerks/:id/edit' => 'clerks#update'
  get 'clerks/:id/delete' => 'clerks#delete'
  get 'clerks/:id' => 'clerks#details'

# SUPPLIER
  get 'suppliers' => 'suppliers#index'
  get 'suppliers/newsupplier' => 'suppliers#newsupplier'
  post 'suppliers' => 'suppliers#add_supplier'
  get 'suppliers/:id/edit' => 'suppliers#edit'
  patch 'suppliers/:id/edit' => 'suppliers#update'
  get 'suppliers/:id/delete' => 'suppliers#delete'
  get 'suppliers/:id' => 'suppliers#details'


# PRODUCTS
  get 'products' => 'products#index'
  get 'products/newproduct' => 'products#newproduct'
  post 'products' => 'products#add_product'
  get 'products/:id/edit' => 'products#edit'
  patch 'products/:id/edit' => 'products#update'
  get 'products/:id/delete' => 'products#delete'
  get 'products/:id' => 'products#details'
  post 'products/find' => 'products#find'

  #ORDERS

  get 'orders' => 'orders#index'
  get 'orders/new_order' => 'orders#new_order'
  post 'orders' => 'orders#add_order'
  get 'orders/:id/delete' => 'orders#delete'
  get 'orders/:id' => 'orders#details'
 
end

