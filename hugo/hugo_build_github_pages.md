Create a token with repo access, and then add it to the secrets for the repo.

make this workflow file:

`.github/deploy-workflow.yaml`

```yaml
name: CI
on: push
jobs:
  deploy:
    runs-on: ubuntu-18.04
    steps:
      - name: Git checkout
        uses: actions/checkout@v2
        with:
          submodules: true

      - name: Setup hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: "0.73.0"
      
      - name: Clean docs
        run: rm -rf docs/

      - name: Build
        # remove --minify tag if you do not need it
        # docs: https://gohugo.io/hugo-pipes/minification/
        run: hugo

      - name: List
        run: |
          ls -Rl docs/
          ls -Rl themes/

      - name: Commit files
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "update site"
          git add *
          git commit -m "Updated site"

      - name: Push changes
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.TOKEN }}
```