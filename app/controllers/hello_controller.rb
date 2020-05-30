class HelloController < ApplicationController

  def index
    @title = "View Sample"
    @msg = "コントローラーに用意した値です。"
  end

end
