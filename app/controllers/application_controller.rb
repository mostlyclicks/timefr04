class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_groups


  protected

    def load_groups
      @groups = Refinery::Groups::Group.all
    end
end
