![Badge](https://sergio-fry.github.io/history/coverage/coverage_badge_total.svg)

# History

## Build

To run locally you should add local ENV via config files: .env.local, .env.test.local. They are added to .gitignore to allow each developer use his own. 

Example config:

```
cat .env.test.local
DATABASE_URL=postgresql://postgres@0.0.0.0:5432/history_test
```

* bundle install
* rails db:create db:migrate
* make

