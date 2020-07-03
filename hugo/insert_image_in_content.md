If you want to be able to have an image under the title of page, then you might want to create a partial that looks like this:

```html
<div class="flex align-center">
  
  {{ if and .Params.header_img }}
    <a href="{{ .Params.img_link }}">
      <img src="{{ .Params.header_img | relURL }}", width = 100%, alt="{{ .Params.img_credit }}", title="{{ .Params.img_credit }}"></img>
    </a>
  {{ end }}

</div>
```

This should be paired with the following parameters in the yaml frontmatter

```yaml
header_img: "/img/chapter_header.jpeg"
img_link: "link_to_img.html"
img_credit: "photo credit text"
```