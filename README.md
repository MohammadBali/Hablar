# Hablar Project

Hablar Flutter Project

# Overview

Built & Developed an E-Learning system that allows new learners to improve their level in the target Language and increase their vocabularies using videos essentially.
This project aims to help people to learn new languages through exposing to a variety of videos, allowing them to widen their vocab storage.

# Introduction

With the rise of media in recent years, and with the rapid increase\
in access to internet and internet-based communications, A growing trend is\
observed, especially among youths to watch hours of TV and videos on social\
networking platforms on a daily basis making it clear to everyone that video\
content plays a big part in our everyday lives. Taking this into account, new\
ways of learning have emerged and one the most efficient ones is learning with\
videos, a powerful alternative to other forms of learning. And with the last\
couple of years lockdowns and other restrictions, distance learning has become\
the most relevant form of learning, this gave video-based learning platforms a\
massive boost in the market, conquering every learnable thing and languages is\
no exception.

Learning a language with videos has proven to be a much better\
option than other forms of learning as it offers a variety of stimuli for\
viewing comprehension, listening comprehension and reading comprehension\
engaging all of the learner senses in the learning process, making it more\
efficient, yet more exciting for learners as they enjoy the content and\
understand the vocabularies simultaneously.

The aim of this project is to build a platform that provides both\
students and teachers with the right tools to make the learning process thrive.

# System Architecture

### **1. Model View Control (MVC):**

MVC is one of the most known, most\
used patterns in the system architectural design.

Mainly, the objective is to\
separate the presentation of the data from the actual data.

**Model:** It’s the component\
that manages the system data and its operations.

The main server will be the model for this system design.

Wepass the data and the logic via APIs to the client side, and there we manage\
how to the data via widgets and forms.

**View:** It manages how the\
data is presented to the user; it will differ from a platform to another since the application can be accessed through mobile application or via web.

**Control: **It manages the\
user’s interactions and pass it to the View and Model parts.

The MVC pattern is feasible for\
this system since there are multiple ways to show the data and how to handle\
the logic.

![](https://media.contra.com/image/upload/w_800,q_auto:best/q9jlqizz9rhhi2vw8md2.avif)



### 2. **Client - Server Pattern:**

In client server pattern, the system is organized and\
distributed into services, and each service provides different job and comes\
from a different server.

Clients use these services to achieve a specified objective.

This pattern becomes useful when we have different servers\
located in different areas and locations, which occurs in this system because\
of the existence of three main servers: Main Server, Merriam Webster Server and\
Google Server.

![](https://media.contra.com/image/upload/w_800,q_auto:best/tdppu00s2aa9ycl05hfv.avif)



# Functional Requirements

A User should be able to do the\
following:

1. Register a New Account.

2. Login into his Account.

3. Browse Language’s Units.

4. Watch Videos in Units or through YouTube Library.

5. View Subtitles and Click on them.

6. Translate Words.

7. Add Words to favorites list.

8. View Favorite words.

9. Take a Quiz.

10. Submit a Paragraph.

11. Change Personal Information.

12. Logout.

13. Take a Lesson.

14. Add a Language.

15. View Achievements.

16. View Leaderboards.

17. Search for Videos in YouTube Library.

18. Switch between light mode and dark mode.

 

A Teacher should be able to do the following:

1. Manage Videos (Add orRemove).

2. Add a Subtitle file to each Video.

3. Manage the list of Unique words for each Video.

4. View Paragraphs submitted by Students.

5. Grade Paragraphs.

6. Manage a Unit for a Specified Language (Add or Remove).

7. Set a Unit as Ready or Not Ready.

8. Manage Lessons (Add or Remove).

The Root should be able to do the following:

The Root is the super of Teacher, meaning he can do whatever the teacher can additional to:

1. Manage Languages (Add or Remove).

2. Manage Teachers (Add or Remove).

3. Manage Students (Add or Remove).

4. Manage Achievements through System.

# Non - Functional Requirements
![](https://media.contra.com/image/upload/w_800,q_auto:best/bdqhcyq67cargudl5vwh.avif)

