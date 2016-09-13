json.array!(current_user.host_reservations) do |res|
json.extract! res, :id
if res.confirmed == true
  json.title "Confirmed: " + res.listing.venue.name
  json.description "confirmed"
else
  json.title "Pending: " + res.listing.venue.name
  json.description "pending"
end
json.start res.start_date
json.end res.end_date+1
json.url reservation_url(res, format: :html)

end
