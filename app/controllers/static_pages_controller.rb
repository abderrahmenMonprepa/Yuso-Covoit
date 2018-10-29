class StaticPagesController < ApplicationController

  def home
  	@last_routes = Route.last(3)
  end

  def contact
  end

  def about_us
  end
end
