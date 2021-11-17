Rails.application.routes.draw do
  namespace :customer do
    get 'addresses/index'
    get 'addresses/create'
    get 'addresses/edit'
    get 'addresses/update'
    get 'addresses/destroy'
  end
  namespace :customer do
    get 'orders/index'
    get 'orders/show'
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/create'
    get 'orders/complete'
  end
  namespace :customer do
    get 'cart_items/index'
    get 'cart_items/create'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/all_destroy'
  end
  namespace :customer do
    get 'items/index'
    get 'items/show'
  end
  namespace :customer do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/out'
  end
  namespace :customer do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'categories/index'
    get 'categories/create'
    get 'categories/edit'
    get 'categories/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
