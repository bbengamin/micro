<?php echo $header; ?>
<header>
    <div class="container-fluid padding0">

        <div class="left-block col-md-2 col-sm-2 col-xs-2 padding0">
            <div class="logo">
              <a href='/'>
                <img src="/catalog/view/theme/default/img/logo.png" alt="alt" class="img-responsive">
                <span class="logo-text__top">МicroзайМ</span>
                <span class="logo-text__bottom">Здесь и сейчас</span>
               </a>
            </div>
            <nav class="navbar">
                <ul class="navbar-nav">
                    <li><a href="#map">Пункты выдачи займов</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#myModal-call-back">Заказать звонок</a></li>
                    <li><a href="<?php echo $getDebt; ?>">Проверить задолженность</a></li>
                    <li><a href="<?php echo $getDebt; ?>">Оплата услуг on-line</a></li>
                </ul>
            </nav>
            <span class="open-menu" onclick="openNav()">
                            <span></span>
                            <span></span>
                        </span>
        </div>
        <div class="col-md-10 col-sm-10 col-xs-10 padding0">
            <div class="form-top">
                <span class="top-line"><a href="/">Главная</a></span>
                <h2>Проверить задолженность</h2>
                <p>Для проверки задолженности внесите данные.</p>
                <p>После внесения данных вы получите возможность оплатить задолженность онлайн.</p>
                <form action="" id='getDebt'>
                    <div class="form-wrapp">
                      <div class="form-block">
                          <label for="surname">Фамилия</label>
                          <input type="text" name="clientname[]" id="surname" value=''>
                      </div>
                      <div class="form-block">
                          <label for="name">Имя</label>
                          <input type="text" name="clientname[]" id="name" value=''>
                      </div>
                      <div class="form-block">
                          <label for="patronymic">Отчество</label>
                          <input type="text" name="clientname[]" id="patronymic" value=''>
                      </div>
                      <div class="pasport-id">
                          <div class="form-block form-block-small">
														<label for="pasport">Серия и номер паспорта</label>
                              <input type="text" name="clientdocs" id="pasport" value=''>
                          </div>
                          <div class="form-block">
                              <input type="text" name="clientdocn" value=''>
                          </div>
                      </div>
                    </div>
                    <div class="form-button">
                      <input type="submit" name="" value="УЗНАТЬ ЗАДОЛЖЕННОСТЬ">
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
<section id='top-sec' class='non-active'>
    <div class="container-fluid padding0">
        <div class="col-md-2 col-sm-2 col-xs-2 padding0">
            <div class="contact-info form-info hidden-sm">
                <p>Заявки по телефону:</p>
                <p class="secendary-text">(звонки бесплатно)</p>
                <span class="tel">8 <span>(800)</span> 234-88-77</span>
                <span class="tel">8 <span>(3022)</span> 50-00-40</span>
            </div>
        </div>
        <div id='info-res' class="graph-top col-md-10 col-sm-10 col-xs-10 padding0 hidden">
          <div class="graph-wrapp">
            <div class="graph">
              <h2>ГРАФИК ПЛАТЕЖЕЙ</h2>
              <div class="graph-block-wrapp">

                <div class="graph-block-content">
                  <ul class="graph-top-line ">
                    <li>Номер договора</li>
                    <li>Статус</li>
                    <li>Задолженность</li>
                    <li>Дата следующего платежа</li>
                  </ul>
                </div>
                <div id='res-debt'>
                    
                </div>
              </div>
              <div id='res-debt-mob' class="small-desktop-graph ">
              </div>

            </div>
            <div class="payment hidden">
              <div class="next-payment">
                <h3>СЛЕДУЮЩИЙ<br>ПЛАТЕЖ</h3>
                <strong><span id='next-sum'>12 500</span><span>руб.</span></strong>
                <span id='next-date'>25.02.2017</span>
              </div>
              <div class="online">
                <h3>ОПЛАТИТЬ<span>ONLINE</span></h3>
                <p>Вы можете внести платеж онлайн с помощью кошелька ComePay, терминала или банковской карты</p>
                <form accept-charset="UTF-8" id="billRequest" method="post" target="_blank" action="https://shop.comepay.ru/Bill/BillHtmlRequest">
                  <input name="Account" type="hidden" value="54885">
                  <input id="MerchantOrderId" name="MerchantOrderId" type="hidden" value="<?php echo $orderId; ?>" autocomplete="off">
                  <div class="input-wrapp">
                    <input type="hidden" value="" name="Comment" id="compayComment" required />
                    <input type="text" id="Amount" data-mask="" name="Amount" autocomplete="off" required placeholder="Сумма платежа">
                    <input type="text" autocomplete="off" data-mask="+7(999) 999-99-99" id="PayerPurse" name="PayerPurse" placeholder="+7 (ххх) ххх-хх-хх">
                  </div>
                  <div class="submit-wrapp">
                    <input type="submit" name="" id="payButton" value="ОПЛАТИТЬ">
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
    </div>
</section>
<form id="payForm" action="https://shop.comepay.ru/Order/external/main.action " method="get" target="_self">
  <input type="hidden" name="shop" value="1194942">
  <input type="hidden" name="transaction" value="<?php echo $orderId; ?>">
  <input type="hidden" name="successUrl" value="<?php echo $success; ?>">
  <input type="hidden" name="failUrl" value="<?php echo $fail; ?>">
</form>
<div class="loader"><img src="http://toyotarostov-services.brand-app.biz/assets/icons/ring.svg" width="42px"></div>
<script>
  $("#PayerPurse").mask("+7(999) 999-99-99");
  $(document).ready(function(){
    $('#billRequest').on('submit',function(e){
      e.preventDefault();
      
      var phone = $('#PayerPurse').val().replace(/\D/g,'');;
      var amount = $('#Amount').val();
      var comment = "";
      $('#getDebt input[type="text"]').each(function(){
        comment += $(this).val() + " ";
      })
      $.post("/index.php?route=product/debt/getPayment&order=<?php echo $orderId; ?>",
            {
              'user': phone,
              'amount': amount,
              'comment': comment
            },
            function(result) {
              if(result.result=='OK') {
                $('#payForm').submit();
              } else {
                alert('Проверьте введенные Вами данные!');
              }
            },"json"
        );
      return false;
    });
    function badResult(text){
    $('#res-debt').html("<div class='bad-result'>" + text + "</div>");
  }
    $('#getDebt').on('submit', function(e){
        e.preventDefault();
        $('.payment').addClass('hidden');
        $('#res-debt').empty();
        $('#res-debt-mob').empty();
  			
  				$.ajax({
            method: "POST",
            url: "/index.php?route=product/debt/getDebt",
            dataType: 'json',
  					data: $(this).serialize(),
  					beforeSend: function(){
              $('#overlay').show();
              $('.loader').show();
  					},
            success: function (response) {
                $('#overlay').hide();
                $('.loader').hide();
                $('#info-res').removeClass('hidden');
                $('#top-sec').removeClass('non-active');
  						
                if (response.error != null) {
                  badResult(response.error);
  					  	} else {
                  var content = "";
                  var contentmob = "";
    							$('.payment').removeClass('hidden');
    							$.each(response, function (i, val) {
    								var summ = val.loanrestcostall + val.percentcostall + val.penicostall;
    								
    								if (val.status != 'Выдан') {
    									summ = 0;
    								}
    								var color1 = 'green';
    								var color2 = 'null';
    								if (val.status == 'Выдан') {
    								  color1 = 'danger';
    								  color2 = 'danger';
    								  
    								  $('#next-sum').text(val.nextpaycostall);
    								  $('#next-date').text(val.nextpaydate);
    								}else if(val.status == "Закрыт с просрочкой"){
  							      color1 = 'orange';
    								  color2 = 'null';
    								}
    								content +=      '<div class="graph-block-content">' +
                                      '<ul class="graph-table top-g">' + 
                                        '<li>' + val.number + '</li>'+
                                        '<li class="' + color1 + '">' + val.status + '</li>' + 
                                        '<li class="' + color2 + '">' + summ.toFixed(2) + '</li>' + 
                      	                '<li class="light">' + val.nextpaydate + '</li>' + 
                                      '</ul>' + 
                                    '</div>';
                                    
                    contentmob +='<div class="small-graph-content top-g">' +
                                    '<p>' + val.number + '</p>' +
                                    '<strong class="' + color1 + '">' + val.status + '</strong>' +
                                    '<div class="small-wrapp">' +
                                      '<ul>' +
                                        '<li>Задолженность</li>' +
                                        '<li>Дата следующего платежа</li>' +
                                      '</ul>' +
                                      '<ul class="right-wrapp">' +
                                        '<li class="' + color2 + '">' + summ.toFixed(2) + '</li>' +
                                        '<li class="date">' + val.nextpaydate + '</li>' +
                                      '</ul>' +
                                    '</div>' +
                                  '</div>';
    							});
  						  	$('#res-debt').html(content);
  						    $('#res-debt-mob').html(contentmob);
  						  }
              },
              error: function (response) {
                  console.log(response);
              }
            });
  			return false;
    });
  });
</script>
<?php echo $footer; ?>