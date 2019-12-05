# README

NEWBIE
A Credibility Checker For News Articles


Team Members:-

Rishabh Jain

Shashwat Goel

Weilan Yu 

Zhenhua Tan


Fake News has become one of the most important problems of the 21st century. It not only makes people believe false things, but also diverges their attention away from the actual real world news. Making people vulnerable and susceptible to false information, Fake News and the spread of misinformation weakens our society. 

Newbie is an application that aims at tackling this problem of Fake News. It would allow you to distinguish Fake and Real News Articles in an easy to use manner. 

We built a news credibility checker, which allows a user to check the credibility of an article along with giving them an option to sign up/login and follow other users they are interested in. We use a complex model as the backbone of credibility checking system, though our dataset is not comprehensive enough to cover all sources. The complex model uses the maximum of the credibility score from all the similar websites and then adds a proportion of score from the other similar website’s score. The model is not perfect as it is difficult to quantify this score, but it can be tuned in future to reflect more accurate results. Along with the credibility score, user is also provided with similar articles from the database in order to manually look up similar articles. 

The load testing and scaling the application to work under higher workloads was the most difficult and important thing for this class. The optimization methods like Caching, PostgreSQL Optimization, Vertical Scaling, Read Replicas and Horizontal Scaling were used to enhance the performance of the application which was clearly visible from the load tests done using tsung. To scale the web scraping of the articles from the web in order to find similar articles was achieved by keeping a local database of articles. This was the most scalable option which can be extended in the future by running a cron job that periodically updates this database with new articles from the web. Overall, this class taught us about different ways to scale an application and test it under different set of workloads that mimic the real world.  
