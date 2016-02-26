#### Setup

```
bin/setup
```

### Gemini reports
##### Gemini bootstrapping
- To setup environments please run `bin/gemini setup` from project root directory
- Generate cannonical images `bin/gemini gather <path_to_tests>`
- Run report generating command `bin/gemini test <path_to_tests>`

##### Gemini reports uploading
- Use <a href="https://www.firebase.com/login/">Firebase</a>. You need to create account and simple application in it.
- Upload report with a command `bin/gemini upload <app_name>` . If `<app_name>` is not specified -
 your report will be uploaded to <a href="https://rails-boilerplate.firebaseapp.com/">default app</a>.
