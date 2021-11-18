Rails.application.routes.draw do
  
  devise_for :customers
  root 'homes#top'
  get 'about' => 'homes#about', as: 'about'


  #会員側のルーティング設定
  resources :addresses, except: [:show, :new]

  resources :orders, except: [:edit, :update, :destroy]
  get 'orders/confirm' => 'orders#confirm', as: 'confirm'
  get 'orders/complete' => 'orders#complete', as: 'complete'

  resources :cart_items, except: [:show, :new, :edit]
  delete '/:id' => 'cart_items#all_destroy'

  resources :items, only: [:index, :show]

  resources :customers, only: [:show, :edit, :update]
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch '/' => 'customers#out'

  # 管理者側のルーティング設定
  namespace :admin do
    
    devise_for :admins
    
    resources :order_details, only: :update
    resources :orders, only: [:index, :show, :update]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: :destroy
  end
end
