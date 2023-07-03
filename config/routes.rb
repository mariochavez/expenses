Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  if !Rails.env.development?
    get "/404", to: "accounts#page_not_found", as: :page_not_found
  end

  resources :accounts, except: [:destroy], path: "cuentas"
  # Defines the root path route ("/")
  # root "articles#index"
end
