class HelloController < ApplicationController

  def index
    if request.post? then
      @title = 'Result'
      if params['check1'] then
        @msg = 'you Checked!!'
      else
        @msg = 'not checked...'
      end
    else
      @title = 'Index'
      @msg = 'check it...'
    end
  end

  # not needed method
  #begin
  #def other
  #  redirect_to action: :index, params: {'msg': 'from other page'}
  #end
  #=end
end
