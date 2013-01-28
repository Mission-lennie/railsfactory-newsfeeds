class TweetsController < ApplicationController
  def index
    @t = Tweet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @t }
    end
  end
end
