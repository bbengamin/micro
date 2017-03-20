
<section>
    <div class="container-fluid padding0">
        <div class="col-md-2 col-sm-2 col-xs-2 padding0"></div>
        <div class="map-footer col-md-10 col-sm-10 col-xs-10 padding0">
            <div id="map">
                

            </div>
            <div class="map-nav">
                <h2>офисы в чите</h2>
                <ul>
                    <li><a onclick='moveMap({lat: 52.069760, lng: 113.389781})'>проспект Фадеева, 14а</a></li>
                    <li><a onclick='moveMap({lat: 52.065628, lng: 113.395354})' class="active">проспект Фадеева, 33е (киоск)</a></li>
                    <li><a onclick='moveMap({lat: 52.022231, lng: 113.545112})'>ул. Гагарина, 7а</a></li>
                    <li><a onclick='moveMap({lat: 52.032998, lng: 113.448432})'>проспект Советов, 5в (киоск)</a></li>
                    <li><a onclick='moveMap({lat: 52.042665, lng: 113.493861})'>ул. Бабушкина, 104/3 (киоск)</a></li>
                    <li><a onclick='moveMap({lat: 52.041816, lng: 113.465673})'>ул. Комсомольская, 105а (киоск)</a></li>
                    <li><a onclick='moveMap({lat: 52.036186, lng: 113.493112})'>ул. Ленина, 125/1 (киоск)</a></li>
                    <li><a onclick='moveMap({lat: 52.056058, lng: 113.486946})'>ул. Новобульварная, 96</a></li>
                    <li><a onclick='moveMap({lat: 52.076470, lng: 113.376037})'>ул. Весенняя, 18б (киоск)</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>


<div class="overlay" id="overlay" onclick="closeNav()">

</div>
<script>
    /* Set the width of the side navigation to 250px */
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("overlay").style.display = "block";
    }

    /* Set the width of the side navigation to 0 */
    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("overlay").style.display = "none";
    }
</script>



<!-- Modal-call-back -->
<div id="myModal-call-back" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Закажите звонок и наш <br>
                специалист свяжется с Вами</h4>
      </div>
      <div class="modal-body">
        <form id='call-back-modal'>
            <div class="input-field">
                <input type='text' name='name' placeholder='Имя' required='required'>
            </div>
            <div class="input-field">
                <input type='text' name='phone' placeholder='Телефон' required='required'>
            </div>
            <div class="input-field">
                <textarea name='comment' placeholder='Комментарий'></textarea>
            </div>
            <div class="input-field">
                <button id='call-back-modal-sumbit' type='sumbit'>Заказать звонок</button>
            </div>
        </form>
        <div class="success-m">
            <h3>Спасибо за заявку, наш специалист свяжется с Вами в ближайшее время.</h3>
        </div>
        <p>Мы гарантируем конфиденциальность ваших данных</p>
      </div>
      
    </div>

  </div>
</div>

<!-- Modal-form -->
<div id="myModal-form" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Получить деньги<br>
                    на выгодных условиях</h4>
      </div>
      <div class="modal-body">
        <form id='form-modal'>
            <input name='days' id='daysInput' type='hidden'>
            <input name='price' id='priceInput' type='hidden'>
            <div class="input-field">
                <input type='text' name='lastname' placeholder='Фамилия' required='required'>
            </div>
            <div class="input-field">
                <input type='text' name='name' placeholder='Имя' required='required'>
            </div>
            <div class="input-field">
                <input type='text' name='theardname' placeholder='Отчество' required='required'>
            </div>
            <div class="input-field">
                <input type='text' name='pasp-series' placeholder='Серия паспорта' required='required'>
            </div>
            <div class="input-field">
                <input type='text' name='pasp-number' placeholder='Номер паспорта' required='required'>
            </div>
            <div class="input-field">
                <input type='text' name='phone' placeholder='Телефон' required='required'>
            </div>
           
            <div class="input-field">
                <button id='form-modal-sumbit' type='sumbit'>Получить деньги</button>
            </div>
        </form>
        <div class="success-m">
            <h3>Спасибо за заявку, наш специалист свяжется с Вами в ближайшее время.</h3>
        </div>
            <p>Мы гарантируем конфиденциальность ваших данных</p>
      </div>
      
    </div>

  </div>
</div>

</body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiMsEABOUVziAQ-IXKhcHsDytBbV055UA&callback=initMap" async defer></script>
<script>
    $('#form-modal').on('submit',function(e){
		e.preventDefault();
		$('#form-modal input').removeClass('red_error');
		$('#form-modal .error').detach();
		$.ajax({
			url: 'index.php?route=checkout/fast/fastorder',
			type: 'post',
			data: $('#form-modal input'),
			dataType: 'json',
			success: function(json) {
				$('#form-modal .error');
				if(json['error']){
					if (json['error']['lastname']) {
						$('#form-modal input[name="lastname"]').after('<span class="error">' + json['error']['lastname'] + '</span>');
						$('#form-modal input[name="lastname"]').addClass('red_error');
					}
					if (json['error']['name']) {
						$('#form-modal input[name="name"]').after('<span class="error">' + json['error']['name'] + '</span>');
						$('#form-modal input[name="name"]').addClass('red_error');
					}
					if (json['error']['theardname']) {
						$('#form-modal input[name="theardname"]').after('<span class="error">' + json['error']['theardname'] + '</span>');
						$('#form-modal input[name="theardname"]').addClass('red_error');
					}
					if (json['error']['pasp-series']) {
						$('#form-modal input[name="pasp-series"]').after('<span class="error">' + json['error']['pasp-series'] + '</span>');
						$('#form-modal input[name="pasp-series"]').addClass('red_error');
					}
					if (json['error']['pasp-number']) {
						$('#form-modal input[name="pasp-number"]').after('<span class="error">' + json['error']['pasp-number'] + '</span>');
						$('#form-modal input[name="pasp-number"]').addClass('red_error');
					}
					if (json['error']['phone']) {
						$('#form-modal input[name="phone"]').after('<span class="error">' + json['error']['phone'] + '</span>');
						$('#form-modal input[name="phone"]').addClass('red_error');
					}
				}

				if (json['success']) {
					$('#form-modal').hide();
					$('#form-modal').next().show();
				}
			}
		});

		return false;
	});
	$('#call-back-modal').on('submit',function(e){
		e.preventDefault();
		$('#call-back-modal input').removeClass('red_error');
		$('#call-back-modal .error').detach();
		$.ajax({
			url: 'index.php?route=checkout/fast/callback',
			type: 'post',
			data: $('#call-back-modal input,#call-back-modal textarea'),
			dataType: 'json',
			success: function(json) {
				$('#call-back-modal .error');
				if(json['error']){
					if (json['error']['name']) {
						$('#call-back-modal input[name="name"]').after('<span class="error">' + json['error']['name'] + '</span>');
						$('#call-back-modal input[name="name"]').addClass('red_error');
					}
					if (json['error']['phone']) {
						$('#call-back-modal input[name="phone"]').after('<span class="error">' + json['error']['phone'] + '</span>');
						$('#call-back-modal input[name="phone"]').addClass('red_error');
					}
				}

				if (json['success']) {
					$('#call-back-modal').hide();
					$('#call-back-modal').next().show();
				}
			}
		});

		return false;
	});

    var map = null;
    function initMap() {
        // Create a map object and specify the DOM element for display.
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat:52.065569, lng: 113.396266},
            scrollwheel: false,
            zoom: 18
        });
        // Create an array of styles.
        var styles = [
            {
                featureType: "all",
                stylers: [
                    {lightness: 0},
                    {saturation: -80}
                ]
            }, {
                featureType: "road.arterial",
                elementType: "geometry",
                stylers: [
                    {hue: "#00ffee"},
                    {saturation: 50}
                ]
            }, {
                featureType: "poi.business",
                elementType: "labels",
                stylers: [
                    {visibility: "on"}
                ]
            }
        ];
        var styledMap = new google.maps.StyledMapType(styles,
            {name: "Styled Map"});
        var mapOptions = {
            zoom: 18,
            scrollwheel: false,
            center: new google.maps.LatLng(52.065569, 113.396266),
            mapTypeControlOptions: {
                mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']


            }
        };
        map = new google.maps.Map(document.getElementById('map'),
            mapOptions);
        map.mapTypes.set('map_style', styledMap);
        map.setMapTypeId('map_style');
        //fadeeva33
        var image = '/catalog/view/theme/default/img/flag-icon.png';
        var beachMarker = new google.maps.Marker({
            position: {lat: 52.065628, lng: 113.395354},
            map: map,
            icon: image,
            width: 70,
            height: 70
        });
        //fadeeva14
        var image = '/catalog/view/theme/default/img/flag-icon.png';
        var beachMarker = new google.maps.Marker({
            position: {lat: 52.069760, lng: 113.389781},
            map: map,
            icon: image,
            width: 70,
            height: 70
        });
        //gagarina
        var image = '/catalog/view/theme/default/img/flag-icon.png';
        var beachMarker = new google.maps.Marker({
            position: {lat: 52.022231, lng: 113.545112},
            map: map,
            icon: image,
            width: 70,
            height: 70
        });
        //sovetov
        var image = '/catalog/view/theme/default/img/flag-icon.png';
        var beachMarker = new google.maps.Marker({
            position: {lat: 52.032998, lng: 113.448432},
            map: map,
            icon: image,
            width: 70,
            height: 70
        });
        //babushkina
        var image = '/catalog/view/theme/default/img/flag-icon.png';
        var beachMarker = new google.maps.Marker({
            position: {lat: 52.042665, lng: 113.493861},
            map: map,
            icon: image,
            width: 70,
            height: 70
        });
        //comsomolskaya
        var image = '/catalog/view/theme/default/img/flag-icon.png';
        var beachMarker = new google.maps.Marker({
            position: {lat: 52.041816, lng: 113.465673},
            map: map,
            icon: image,
            width: 70,
            height: 70
        });
        //lenina
        var image = '/catalog/view/theme/default/img/flag-icon.png';
        var beachMarker = new google.maps.Marker({
            position: {lat: 52.036186, lng: 113.493112},
            map: map,
            icon: image,
            width: 70,
            height: 70
        });
        //novobulvar
        var image = '/catalog/view/theme/default/img/flag-icon.png';
        var beachMarker = new google.maps.Marker({
            position: {lat: 52.056058, lng: 113.486946},
            map: map,
            icon: image,
            width: 70,
            height: 70
        });
        //vesenniya
        var image = '/catalog/view/theme/default/img/flag-icon.png';
        var beachMarker = new google.maps.Marker({
            position: {lat: 52.076470, lng: 113.376037},
            map: map,
            icon: image,
            width: 70,
            height: 70
        });

    }
    function moveMap(text){
        map.panTo(text);
    }
    $(document).ready(function(){
        $('.map-nav a').on('click', function(){
            $('.map-nav a').removeClass('active');
            $(this).addClass('active');
        });
    })
    $("input[name='phone']").mask("+7(999) 999-99-99");
</script>

</html>


