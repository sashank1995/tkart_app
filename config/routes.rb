Rails.application.routes.draw do

  root 'admin/men/shirts#index'

  namespace :admin do
    namespace :men do
      resources :shirts
    end

    namespace :women do
      resources :shirts
    end
  end

  namespace :store do
    namespace :men do
      resources :shirts, only: [:index, :show] do
        member do
          post :add_to_cart
          delete :remove_from_cart
        end

        collection do
          get :cart
          get :checkout
          post :send_mail
        end
      end
    end

    namespace :women do
      resources :shirts, only: [:index, :show] do
        member do
          post :add_to_cart
          delete :remove_from_cart
        end

        collection do
          get :cart
          get :checkout
          post :send_mail
        end
      end
    end
  end

  #post 'store/men/shirts/send_mail', to: 'store/men/shirts#send_mail', as: :send_mail
  #get 'store/men/shirts/cart', to: 'store/men/shirts#cart', as: :store_mens_cart
end
