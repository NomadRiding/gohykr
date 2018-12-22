class ItineraryPresenter < SimpleDelegator
  include ActionView::Helpers::DateHelper

  def avatar
    avatar_image
  end

  def start_location
    locations&.origin&.address
  end

  def end_location
    locations&.destination&.address
  end

  def eta
    distance_of_time_in_words(format(start_date), format(end_date))
  end

  def username
    user.username
  end

  def short_description
    self.description.truncate(45, separator: /\s/)
  end

  private

  def format(date)
    Date.strptime(date, '%Y-%m-%d')
  end
end
