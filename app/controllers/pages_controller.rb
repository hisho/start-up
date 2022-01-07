class PagesController < ApplicationController
  def index
    @categories = Category.all.limit(10)
  end
  def about

  end
end