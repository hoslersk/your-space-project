json.array!(@reservations) do |res|

json.extract! res, :id
json.title res.listing.venue.name
json.start res.start_date
json.end res.end_date
json.url reservation_url(res, format: :html)

end
