json.array!(current_user.renter_reservations) do |res|

json.extract! res, :id
if res.confirmed == true
  json.title "Confirmed (renter): " + res.listing.venue.name
else
  json.title "Pending (renter): " + res.listing.venue.name
end
json.start res.start_date
json.end res.end_date+1
json.url reservation_url(res, format: :html)

end

json.array!(current_user.host_reservations) do |res|
json.extract! res, :id
if res.confirmed == true
  json.title "Confirmed (host): " + res.listing.venue.name
else
  json.title "Pending (host): " + res.listing.venue.name
end
json.start res.start_date
json.end res.end_date+1
json.url reservation_url(res, format: :html)

end
