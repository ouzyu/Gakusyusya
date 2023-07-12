Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'

    #deviseとの競合回避の為、infomationをurlに追加
    get 'users/mypage'            => 'users#show',        as: 'mypage'
    get 'users/information/edit'  => 'users#edit',        as: 'edit_information'
    patch 'users/information'     => 'users#update',      as: 'update_information'
    get 'users/unsubscribe'       => 'users#unsubscribe', as: 'confirm_unsubscribe'
    put 'users/information'       => 'users#update'
    patch 'users/withdraw'        => 'users#withdraw',    as: 'withdraw_user'
    get 'users/attention'         => 'users#attention',   as: 'attention'

    resources :abilities, only: [:index, :create, :edit, :update, :destroy]
    resources :quests,    only: [:new, :index, :create]

    get 'adventures/start'      => 'adventures#start'
    get 'adventures/boss'       => 'adventures#boss'
    patch 'adventures/retire'   => 'adventures#retire'
    patch 'adventures/pause'    => 'adventures#pause'
    patch 'adventures/unpause'  => 'adventures#unpause'
    patch 'adventures/finish'   => 'adventures#finish'

  end

  namespace :admin do
    resources :users,       only: [:index, :show, :edit, :update]
    resources :actors,      only: [:index, :create, :show, :edit, :update, :destroy]
    resources :situations,  only: [:show, :create, :edit, :update, :destroy]
    resources :animations,  only: [:create, :edit, :update, :destroy]
    resources :maps,        only: [:index, :create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
