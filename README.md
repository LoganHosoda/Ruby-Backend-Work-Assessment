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

============================

Notes to reviewer:

My apologies for the time that it has taken for me to complete this project. There are a few different things that I would like to take note of.

First, I'm currently working full time, 5 days a week, night shift, consistent overtime, and I have 4 kids. Because of this, time has been very limited, so I was only able to dedicate on average about 3 hours per day at most towards the project.

Actual completion time for the project: ~15 hours.

Additionally I would like to mention that prior to receiving this assessment, I had hardly any knowledge regarding what an API was, much less how to create one. This has also been my very first exposure to Ruby on Rails, or anything beyond the realm of writing basic html, css, javascript, ruby, c++, or data structures/algorithms. So I've essentially learned everything on the spot to get this project done.

I'm excited and ready for the constructive criticism coming my way. Please do give me as many pointers as possible so that I can continue to improve! 

- Logan Hosoda

============================

Known issues/areas to improve upon:

1. Testing suite
  - The suite lacks robustness. Due to lack of time, and lack of knowledge, I decided to expedite submission and implemented what I already knew, so that I could put my focus into researching/building the project. This is undoubtedly an area that could greatly benefit from improvement.
  - I wasn't sure if it was necessary to do more with the testing suite for the Models, knowing that the Controller passing it's tests would indicate that the Model is also functioning correctly. For the sake of avoiding redundancy (and to save time), I decided to forgo this implementation. Please feel free to let me know what the best practice is!
2. Caching
  - For the same reasons above, I decided to implement a 'pseudo-cache' method. Essentially it eliminates the need to make multiple API requests by saving the result of the API fetch to the database. All subsequent check to specified urls will check the database to see if the 'chached' data has expired. If expired, then it will fetch from the Hatchways API, and update with the fresh data.
  - This method is quite naive/linear, and doesn't utilize the many powerful caching methods available to Rails. Given the time to put more research into implementing these methods, I would look into replacing my current method.