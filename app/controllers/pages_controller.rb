class PagesController < ApplicationController
  def home
    redirect_to movies_path if current_user
  end
end
