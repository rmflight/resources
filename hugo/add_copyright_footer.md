Add a `params.BookAuthor` and `params.CopyRightYear` to the `config.toml`, and then in the `footer.html` partial you can add

```html
<div class="flex flex-wrap justify-between">
{{ if .Site.IsMultiLingual }}
  {{ partial "docs/languages" . }}
{{ end }}

{{ if and .Site.Params.BookAuthor .Site.Params.CopyRightYear }}
  <div>
    <p> All content copyright {{ .Site.Params.BookAuthor }}, {{ .Site.Params.CopyRightYear }} </p>
  </div>
{{ end }}
</div>
```