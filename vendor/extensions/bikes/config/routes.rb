Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :bikes do
    resources :bikes, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :bikes, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :bikes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :bikes do
    resources :colors, :only => [:index, :show]
  end

  # Admin routes
  namespace :bikes, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/bikes" do
      resources :colors, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
