Rails.application.routes.draw do

  namespace :mobile do
  get 'books/index'
  end

  namespace :mobile do
  get 'books/show'
  end

  namespace :admin do
  get 'subcategories/new'
  end

  namespace :admin do
  get 'subcategories/create'
  end

  namespace :admin do
  get 'subcategories/edit'
  end

  namespace :admin do
  get 'subcategories/updated'
  end

  namespace :admin do
  get 'subcategories/destroy'
  end

  namespace :admin do
  get 'subcategories/index'
  end

  namespace :admin do
  get 'subcategories/show'
  end

  namespace :admin do
  get "login" => 'sessions#new', :as => "login"
  end
  
  namespace :admin do
  get "logout" => 'sessions#destroy', :as => "logout"
  end
  
  namespace :admin do
    get "delete_chapter" => 'chapters#destroy', :as => "delete_chapter"
  end

  namespace :admin do
  get 'sessions/create'
  end

  namespace :admin do
  get 'chapters/new'
  end

  namespace :admin do
  get 'chapters/create'
  end

  namespace :admin do
  get 'chapters/update'
  end

  namespace :admin do
  get 'chapters/edit'
  end

  namespace :admin do
  get 'chapters/index'
  end

  namespace :admin do
  get 'chapters/show'
  end

  namespace :admin do
  get 'chapters/destroy'
  end

  namespace :admin do
  get 'countviews/new'
  end

  namespace :admin do
  get 'countviews/create'
  end

  namespace :admin do
  get 'countviews/update'
  end

  namespace :admin do
  get 'countviews/edit'
  end

  namespace :admin do
  get 'countviews/index'
  end

  namespace :admin do
  get 'countviews/show'
  end

  namespace :admin do
  get 'countviews/destroy'
  end

  namespace :admin do
  get 'books/new'
  end

  namespace :admin do
  get 'books/create'
  end

  namespace :admin do
  get 'books/edit'
  end

  namespace :admin do
  get 'books/update'
  end

  namespace :admin do
  get 'books/destroy'
  end

  namespace :admin do
  get 'books/show'
  end

  namespace :admin do
  get 'books/index'
  end

  get 'books/index'


  namespace :admin do
  get 'quotes/new'
  end

  namespace :admin do
  get 'quotes/create'
  end

  namespace :admin do
  get 'quotes/index'
  end

  namespace :admin do
  get 'quotes/show'
  end

  namespace :admin do
  get 'quotes/update'
  end

  namespace :admin do
  get 'quotes/edit'
  end

  namespace :admin do
  get 'quotes/destroy'
  end

  namespace :admin do
  get 'statuses/new'
  end

  namespace :admin do
  get 'statuses/create'
  end

  namespace :admin do
  get 'statuses/edit'
  end

  namespace :admin do
  get 'statuses/update'
  end

  namespace :admin do
  get 'statuses/destroy'
  end

  namespace :admin do
  get 'statuses/index'
  end

  namespace :admin do
  get 'statuses/show'
  end

  namespace :admin do
  get 'types/new'
  end

  namespace :admin do
  get 'types/create'
  end

  namespace :admin do
  get 'types/edit'
  end

  namespace :admin do
  get 'types/update'
  end

  namespace :admin do
  get 'types/destroy'
  end

  namespace :admin do
  get 'types/show'
  end

  namespace :admin do
  get 'types/index'
  end
  
  namespace :admin do
      get "addchuong/:book_id" => 'chapters#import', :as => "add-chuong"
  end

  
  #get 'sach' => 'sachs#index' --> goi ham dau tien
  
  get 'books/index'
  get 'categories/index'
  get 'categories/show'
  get 'authors/show'
  get 'types/show'
  get 'statuses/show'
  get 'chapters/show'
  get 'searchs/index'
  
  #get '/foo', :to => redirect('/foo.html')
  get "danh-muc/:id" => 'categories#show', :as => "danh-muc"
  get "tac-gia/:id" => 'authors#show', :as => "tac-gia"
  get "trang-thai/:id" => 'statuses#show', :as => "trang-thai"
  get "truyen/:id" => 'books#show', :as => "truyen"
  get "truyen/:book_id/:id" => 'chapters#show', :as => "chuong-truyen"
  get "tim-kiem" => 'searchs#index', :as => "tim-kiem"
  
  namespace :admin do
  get 'categories/create'
  end

  namespace :admin do
  get 'categories/new'
  end

  namespace :admin do
  get 'categories/update'
  end

  namespace :admin do
  get 'categories/edit'
  end

  namespace :admin do
  get 'categories/show'
  end

  namespace :admin do
  get 'categories/index'
  end

  namespace :admin do
  get 'categories/destroy'
  end

  namespace :admin do
  get 'authors/new'
  end

  namespace :admin do
  get 'authors/create'
  end

  namespace :admin do
  get 'authors/edit'
  end

  namespace :admin do
  get 'authors/update'
  end

  namespace :admin do
  get 'authors/index'
  end

  namespace :admin do
  get 'authors/show'
  end

  namespace :admin do
  get 'authors/destroy'
  end
  
  namespace :api do
  get 'books/index'
  get 'subcategories/index'
  end
  
  resources :books, :categories, :searchs
  
  namespace :admin do 
      resources :authors, :categories, :users, :types, :books, :chapters, :countviews, :quotes, :sessions, :statuses, :subcategories
  end
  
  namespace :api do
      resources :books, :subcategories
  end
  
  namespace :admin do
      resources :books do
          resources :chapters
      end
  end
  
  namespace :mobile do
      root 'books#index'
      get "/" => "books#index"
      resources :books
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'books#index'
end
