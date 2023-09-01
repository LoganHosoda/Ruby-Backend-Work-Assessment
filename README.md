# README

Ruby Backend Assessment - Blog Post

Submitted by: Logan Hosoda

Tech used to create this app:

* Ruby version: 3.0.3p157

* Rails version: 7.0.2.3

* Database: postgresql

============================

Instructions:

1. CD to blog_api directory, and run the command "rails s" to boot the server.
2. Make http request to server using the url "http://localhost:3000/api/posts?tag=".
  2.1. Enter valid tag name(s) to retrieve posts that contain any applicable tags.
  2.2. Valid tag examples include: tech, health, politics, history, culture, and more.
  2.3. Example url with multiple tags: "http://localhost:3000/api/posts?tag=tech,health".
3. Optionally sort posts by appending "&sortBy=" to url with a valid sort parameter.
  3.1. Valid sortBy parameters: id, reads, likes, popularity.
  3.2. Example url with valid sortBy parameter: "http://localhost:3000/api/posts?tag=tech,health&sortBy=id"
4. Optionally choose the direction of sort by appending "&direction=" to url with a valid direction parameter.
  4.1. Direction is set to "ascending" by default if no parameter is specified.
  4.2. Valid direction parameters: ascending, asc, descending, desc.
  4.3. Example url with valid direction parameter: "http://localhost:3000/api/posts?tag=tech&sortBy=likes&direction=desc" 

* To run the test suite, simply enter the command "bundle exec rspec"
  
