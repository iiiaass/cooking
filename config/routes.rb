Rails.application.routes.draw do
  namespace :public do
    get 'relationships/create'
    get 'relationships/destroy'
  end
  namespace :public do
    get 'customer/unsubscribe'
  end
  # 顧客用
 devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }
 # 管理者用

 devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

   namespace :admin do
    resources :customers,only:[:index,:show,:edit,:update,:destroy]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :posts,only:[:index,:show,:update,:destroy] do
     resources :comments,only:[:create,:destroy]
    end
   end

   scope module: :public do
    root to:'homes#top'
    patch '/customers/:id/withdraw'=>'customers#withdraw',as:'withdraw'
    resources :customers,only:[:show,:edit,:update] do
     resource :relationships,only:[:create,:destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers', as: 'followers'
    end
    get '/posts/search'=>'posts#search',as:'search'
    resources :posts,only:[:new,:index,:show,:create] do
      resources :comments,only:[:create,:destroy]
      resource :nices,only:[:create,:destroy]
    end

    delete '/customers/:customer_id/posts/:id'=>'posts#destroy',as:'destroy'

   end


end

