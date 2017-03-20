<?php echo $header; ?>

<?php echo $content_bottom; ?><?php echo $column_right; ?>
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
            <div class="contact-info hidden-sm">
                <p>Заявки по телефону:</p>
                <p class="secendary-text">(звонки бесплатно)</p>
                <span class="tel">8 <span>(800)</span> 234-88-77</span>
                <span class="tel">8 <span>(3022)</span> 50-00-40</span>
            </div>
            <span class="open-menu" onclick="openNav()">
                            <span></span>
                            <span></span>
                        </span>
        </div>
        <div class="center-block col-md-10 col-sm-10 col-xs-10 padding0">
            <div class="left-block">
                <div class="top-info">
                    <h1>КОМПАНИЯ<br> <span>МicroзайМ</span</h1>
                    <strong>Вам сюда</strong>
                    <div class="top-buttons">
                        <a  data-toggle="modal" data-target="#myModal-form" class="request-btn">оформить заявку</a>
                        <a href="<?php echo $getDebt; ?>" class="debit-btn">УЗНАТЬ ЗАДОЛЖЕННОСТЬ</a>
                    </div>
                </div>
                <?php echo $content_top; ?>
            </div>
            
            <div class="right-block">
                <h2>рассчитать<br><span>займ</span></h2>
                <p class="summ-name">Сумма займа</p>
                <div class="form-summ">
                    <span id='sum-value'>10000</span>
                </div>
                <div class="range range-summ">
                    <form action="">
                        <input id='sum-range' type="range" min='1000' max='15000' step='1000' value='10000'>
                        <div class="summ-info">
                            <span class="left-summ">0руб.</span>
                            <span class="right-summ">15,000руб.</span>
                        </div>
                    </form>
                </div>
                <p class="summ-name">Количество дней</p>
                <div class="form-day">
                    <span id='day-value'>14</span>
                </div>
                <div class="range range-day">
                    <form action="">
                        <input id='day-range' min='1' max='21' step='1' value='14' type="range">
                        <div class="summ-info">
                            <span class="left-summ">0 дней</span>
                            <span class="right-summ">21 день</span>
                        </div>
                    </form>
                </div>
                <div class="return-info">
                    <p>Всего к возврату:</p>
                    <span><span id='total-sum'>12,800</span> <span class="curen">руб.</span></span>
                    <a href="#" data-toggle="modal" data-target="#myModal-form">получить займ</a>
                </div>
            </div>
            <script>
            $(document).ready(function (){
                $('#sum-range').on('change input',function(){
                    $('#sum-value').text(numberWithCommas($(this).val()));
                    calcPrice();
                });
                $('#day-range').on('change input',function(){
                    $('#day-value').text($(this).val());
                    calcPrice();
                    
                });
                function calcPrice(){
                    var price = parseInt($('#sum-range').val());
                    var day = parseInt($('#day-range').val());
                    var sum = (price * 0.02 * day + price);
                    $('#total-sum').text(numberWithCommas(sum));
                    $('#daysInput').val(day);
                    $('#priceInput').val(price);
                }
                function numberWithCommas(x) {
                    var parts = x.toString().split(".");
                    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    return parts.join(".");
                }
                calcPrice();
            });
            </script>
        </div>
    </div>
</header>
<section>
    <div class="container-fluid padding0">
        <div class="col-md-2 col-sm-2 col-xs-2 padding0"></div>
        <div class="col-md-10 col-sm-10 col-xs-10 padding0">
            <div class="new-textes-wrap">
                <div class="new-textes-item">
                    <div class='head-of-t-item'>
                        <p>первый займ<span class='perc-item pers-zero'>0</span></p>
                        <h3>без процентов<span class='perc-item pers-perc'>%</span></h3>
                    </div>
                    <div class='info-of-t-item'>
                        <p>Широкий выбор кредитных продуктов, в том числе беспроцентные займы при первом обращении и к дню рождения, займы по сниженной ставке для пенсионеров по возрасту, льготные займы для постоянных клиентов.</p>
                        <span>Наш менеджер подберет для Вас займ с наилучшими условиями.</span>
                    </div>
                </div>
                <div class="new-textes-item rt-t-item">
                    <h3>УНИКАЛЬНАЯ<br>ПРОГРАММА ЛОЯЛЬНОСТИ</h3>
                    <p><span>Вы попали в затруднительную ситуацию и не можете<br>погасить займ?</span>
                    <strong>Не отчаивайтесь.</strong> При наличии документального подтверждения мы применяем реструктуризацию и частичное прощение долга! Применение примирительных процедур предусмотрено общими условиями договора. У нас ограничено начисление процентов по займу. 
                    Мы заинтересованы в том, чтобы клиенты обращались к нам неоднократно.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container-fluid padding0">
        <div class="col-md-2 col-sm-2 col-xs-2 padding0">
            
        </div>
        <div class="information-block col-md-10 col-sm-10 col-xs-10 padding0">
            <div class="discounts-block">
                <div class="discounts-content">
                    <div class="discounts-content_wrapp">
                      <p>займ на сайте<br> <span>со скидкой</span></p>
                      <span class="discounts-date">30%</span>
                      <p class="bottom-text">ЗАЙМ СО СНИЖЕННОЙ ПРОЦЕНТНОЙ СТАВКОЙ</p>
                      <a href="#" data-toggle="modal" data-target="#myModal-form">заполнить анкету</a>
                    </div>
                </div>
            </div>
            <div class="block-advantages">
                <div class="advantages content__1">
                    <h3>вы не тратите свое время</h3>
                    <p>Оставьте заявку на сайте или в офисе и мы рассмотрим ее в течение 15 минут!</p>
                </div>
                <div class="advantages content__2">
                    <h3>нужен только паспорт</h3>
                    <p>Вам не нужно собирать справки и искать поручителей!</p>
                </div>
                <div class="advantages content__3">
                    <h3>наши отделения рядом с вами</h3>
                    <p>Широкая сеть офисов в Чите и районных центрах Забайкальского края. Вы можете оформить заявку в одном офисе, а получить займ или произвести оплату в любом другом - там, где Вам удобнее, найдите ближайший офис на <a href="#map">карте</a></p>
                </div>
                <div class="advantages content__4">
                    <h3>нет штрафов и скрытых коммисий</h3>
                    <p>У нас отсутствуют фиксированные штрафы и скрытые комиссии. Полная стоимость займа указана в договоре и является конечной</p>
                </div>
            </div>
        </div>
    </div>
</section>
<?php echo $footer; ?>