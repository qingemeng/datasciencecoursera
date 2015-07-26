library(httr)
library(httpuv)

oauth_endpoints("github")

myapp<- oauth_app("github", key="fde4dd0ba2f1a7ae69d7", secret="0f78d05ad58ab4d78a1207b1f48efa16d75d3560")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache=FALSE)

# req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
# stop_for_status(req)
# content(req)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)
