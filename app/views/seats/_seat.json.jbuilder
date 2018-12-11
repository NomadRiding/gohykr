json.extract! seat, :id, :open_seat, :taken_seat, :itinerary_id, :created_at, :updated_at
json.url seat_url(seat, format: :json)
