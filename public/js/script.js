function getLatLng(place) {

  // ジオコーダのコンストラクタ
  var geocoder = new google.maps.Geocoder();

  // geocodeリクエストを実行。
  // 第１引数はGeocoderRequest。住所⇒緯度経度座標の変換時はaddressプロパティを入れればOK。
  // 第２引数はコールバック関数。
  geocoder.geocode({
    address: place
  }, function (results, status) {
    if (status == google.maps.GeocoderStatus.OK) {

      // 結果の表示範囲。結果が１つとは限らないので、LatLngBoundsで用意。
      var bounds = new google.maps.LatLngBounds();

      for (var i in results) {
        if (results[i].geometry) {

          // 緯度経度を取得
          var latlng = results[i].geometry.location;

          // 住所を取得(日本の場合だけ「日本, 」を削除)
          var address = results[0].formatted_address.replace(/^日本, /, '');

          // 検索結果地が含まれるように範囲を拡大
          bounds.extend(latlng);

          console.log(latlng);