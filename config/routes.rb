Rails.application.routes.draw do

   # 顧客側のdeviseルーティング設定
  devise_for :customers, controllers: {

    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }


  root 'homes#top'

  # 管理者側のdeviseルーティング設定
  devise_for :admins, controllers: {
    sessions: "admin/sessions"
  }

  get 'about' => 'homes#about', as: 'about'


  #会員側のルーティング設定
  resources :addresses, except: [:show, :new]

  # resources の下にいると？うまく遷移しなかったので上にあげてみました。
  post 'orders/confirm' => 'orders#confirm', as: 'confirm'
  get 'orders/complete' => 'orders#complete', as: 'complete'
  resources :orders, except: [:edit, :update, :destroy]

  delete 'cart_items/alldestroy' => 'cart_items#all_destroy', as: 'all_destroy'
  resources :cart_items, except: [:show, :new, :edit]

  get 'items/search' => 'items#search', as: 'search'
  resources :items, only: [:index, :show]

  # 管理者側のルーティング設定
  namespace :admin do
    resources :order_details, only: :update
    resources :orders, only: [:index, :show, :update]
    resources :categories, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: :destroy
  end

  scope module: :customer do
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/out' => 'customers#out', as: 'out'
    resources :customers, only: [:show, :edit, :update]
  end

end
