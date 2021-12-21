# README

Simple and REST blog API. It supports more complex authentication system with the Devise implementation but relies on Warden with an api_token strategy to earn time.

All endpoints have test covering:

* GET /v1/articles
* GET /v1/articles/:id
* POST /v1/articles
* POST /v1/articles/:article_id/article_likes
* GET  /v1/articles/:article_id/comment
* POST  /v1/articles/:article_id/comment
* POST /v1/articles/:article_id/comments/:comment_id/comment_like

Plus the devise endpoints (registration, session, password, etc).

All data criteria is delivered with the serializer logic. This is the return of an article, for example:

```
[{
  "id"=> 2,
  "title"=> "Article A",
  "body"=> "Lorem ipsum dolor sit amet.", 
  "comments_count"=> 10,
  "likes_count"= >5,
  "user_id"=> 3
}]
```

* How to generate report:

Just run `User.report_number_of_posts` and it will return the data in the correct format. Example:

```
User.report_number_of_posts
=> [{:user_id=> 1, :number_of_posts=> 5}]
```
