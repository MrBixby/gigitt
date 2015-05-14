json.array!(@gigs) do |gig|
  json.extract! gig, :id, :name, :event, :date, :doors, :showtime, :age, :price, :description
  json.url gig_url(gig, format: :json)
end
