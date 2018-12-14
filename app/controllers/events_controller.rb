class EventsController < ApplicationController
  def search
    results = Eventbrite::Event.search(
      {q: "#{params[:search_term]} #{params[:location]} #{params[:date]}"}, ENV["EVENTBRITE_TOKEN"]
      # {location.address: params[:search_term]}, ENV["EVENTBRITE_TOKEN"],
      # {start_date.keyword: params[:search_term]}, ENV["EVENTBRITE_TOKEN"]
    )
    @events = results.events
    if @events.nil?
      raise RuntimeError.new('results are nil!')
    end
    render q: params[:search_term]
    # render location.address[:search_term]
    # render start_date.keyword[:search_term]
  end

  def index
  end
end
