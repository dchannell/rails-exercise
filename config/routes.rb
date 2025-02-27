Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    get "/articles", to: "articles#index"
    post "/articles", to: "articles#create"
    get "/article/:id", to: "articles#show"
    put  "/article/:id", to:"articles#not_allowed" 
    patch "/article/:id", to:"articles#not_allowed" 
    delete "/article/:id", to:"articles#not_allowed" 

end
