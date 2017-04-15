class StaticPagesController < ApplicationController

   before_action :logged_in_personnel

  def index
    @end_time = Time.new(2017,5,1)
    @start_time = Time.now
    @elapse = @end_time - @start_time
    @day_left = (@elapse/60/60/24).floor
    @elapse -= @day_left*60*60*24
    
    
    @hour_left = (@elapse/60/60).floor
    @elapse -= @hour_left*60*60

    @min_left = (@elapse/60).floor
    @elapse -= @min_left*60

  end
end
