# home controller
class HomeController < ApplicationController
  def index
    @link = Link.new
    @top_links = Link.order(created_at: :desc)
  end
end
