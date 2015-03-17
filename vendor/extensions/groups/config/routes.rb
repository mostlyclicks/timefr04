Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :groups do
    resources :groups, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :groups, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :groups, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
