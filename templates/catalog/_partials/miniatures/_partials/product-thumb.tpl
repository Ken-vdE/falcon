{block name='product_thumbnail'}
  <div class="product-miniature__thumb position-relative {$thumbExtraClass|default:''}">
    <a href="{$product.url}" class="product-miniature__thumb-link">
      {images_block webpEnabled=$webpEnabled}
        <img
          {if $product.cover}
            data-full-size-image-url="{$product.cover.large.url}"
            {generateImagesSources image=$product.cover size='home_default' lazyload=true}
            alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
            width="{$product.cover.bySize.home_default.width}"
            height="{$product.cover.bySize.home_default.height}"
          {elseif $product.default_image}
            data-full-size-image-url="{$product.default_image.large.url}"
            {generateImagesSources image=$product.default_image size='home_default' lazyload=true}
            alt="{if !empty($product.default_image.legend)}{$product.default_image.legend}{else}{$product.name|truncate:30:'...'}{/if}"
            width="{$product.default_image.bySize.home_default.width}"
            height="{$product.default_image.bySize.home_default.height}"
          {else}
            src="{$urls.no_picture_image.bySize.home_default.url}"
            alt="{$product.name|truncate:30:'...'}"
            width="{$urls.no_picture_image.bySize.home_default.width}"
            height="{$urls.no_picture_image.bySize.home_default.height}"
          {/if}
          class="img-fluid rounded-top lazyload"
          />
      {/images_block}

      {include file='catalog/_partials/product-flags.tpl'}
    </a>

    {block name='quick_view'}
      <a class="quick-view product-miniature__functional-btn btn btn-light shadow rounded-circle" href="#" data-link-action="quickview">
        <span class="material-icons product-miniature__functional-btn-icon">zoom_in</span>
      </a>
    {/block}


    {block name='product_reviews'}
      {hook h='displayProductListReviews' product=$product}
    {/block}
  </div>
{/block}
