class PagesController < ApplicationController
  layout "landing_page"
  def show
    page = params[:page]
    render "pages/#{params[:page]}"

    @user = User.new

  end
end
