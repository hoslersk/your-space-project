json.array!(@venue.listings) do |listing|

json.extract! listing, :id
json.title listing.venue.name
json.start listing.available_start_date
json.end listing.available_end_date
#json.url listing_url(listing, format: :html)


end

@venue.listings.each do |listing|

  json.array!(listing.reservations) do |res|
    if res.confirmed == true
      json.extract! res, :id
      json.title "Not Available"
      json.start res.start_date
      json.end res.end_date
      #json.url reservation_url(res, format: :html)
    end

end
end
