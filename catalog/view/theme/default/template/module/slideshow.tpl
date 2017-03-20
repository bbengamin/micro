<div class="top-slider">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <?php $i=0; foreach ($banners as $banner) { ?>
              <li data-target="#carousel-example-generic" data-slide-to="<?php echo $i; ?>" <?php if($i==0) echo 'class="active"'; ?>></li>
            <?php $i++; } ?>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <?php $i=0; foreach ($banners as $banner) { ?>
            <div class="item <?php if($i==0) echo 'active'; ?>">
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
            </div>
            <?php $i++; } ?>
        </div>
    </div>
</div>