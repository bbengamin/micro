<!DOCTYPE html>
<html lang="ru">

<head>

    <meta charset="utf-8">

    <title><?php echo $title; ?></title>
    <meta name="description" content="<?php echo $description; ?>">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <meta property="og:image" content="path/to/image.jpg">
    <link rel="shortcut icon" href="/catalog/view/theme/default/img/favicon/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="/catalog/view/theme/default/img/favicon/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/catalog/view/theme/default/img/favicon/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/catalog/view/theme/default/img/favicon/apple-touch-icon-114x114.png">

    <!-- Chrome, Firefox OS and Opera -->
    <meta name="theme-color" content="#000">
    <!-- Windows Phone -->
    <meta name="msapplication-navbutton-color" content="#000">
    <!-- iOS Safari -->
    <meta name="apple-mobile-web-app-status-bar-style" content="#000">
    
    <link rel="stylesheet" href="/catalog/view/theme/default/stylesheet/main.min.css">
    <script src="/catalog/view/javascript/scripts.min.js"></script>
    <script src="/catalog/view/javascript/jquery.maskedinput.min.js"></script>

</head>
<body>
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="#map">Пункты выдачи займов</a>
    <a href="#" data-toggle="modal" data-target="#myModal-call-back">Заказать звонок</a>
    <a href="<?php echo $getDebt; ?>">Проверить задолженность</a>
    <a href="<?php echo $getDebt; ?>">Оплата услуг on-line</a>
    <div class="contact-info">
        <p>Заявки по телефону:</p>
        <p class="secendary-text">(звонки бесплатно)</p>
        <span class="tel">8 <span>(800)</span> 234-88-77</span>
        <span class="tel">8 <span>(3022)</span> 50-00-40</span>
    </div>
</div>