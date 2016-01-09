module PlacesHelper
  def gmap(place)
    (
      "<div style='width: 800px;'><div id=\"#{place.id}\" style='width: 800px; height: 400px;'></div></div>" +
      javascript_tag("#{place.id} = Gmaps.build('Google');
      #{place.id}.buildMap({ provider: {}, internal: {id: '#{place.id}'}}, function(){
      markers = #{place.id}.addMarkers([
        {
          \"lat\": #{place.lat},
          \"lng\": #{place.long},
          \"infowindow\": \"#{place.name}\"
        }
      ]);
      #{place.id}.bounds.extendWith(markers);
      #{place.id}.fitMapToBounds();
      });")
    ).html_safe
  end
end
