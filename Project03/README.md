# Cs 1XA3 Project03 - < sandhk8 >  (localhost:10087)

## Usage
* On your command line navigate through /django_templates/Project03 and **make sure you are in the same folder as manage.py**.
* **Make sure you have activated conda environment -- `conda activate djangoenv`**
* Make sure you have the database updated with migration 
`python manage.py makemigrations` followed by `python manage.py migrate`
- Run locally  by `python manage.py runserver localhost:8000`
  Render the feature of the app by url ~ [http://localhost:8000/e/sandhk8/](http://localhost:8000/e/sandhk8/)
- Run on mac1xa3 server by `python manage.py runserver localhost:10087`
 Render the feature of the app by url ~ [http://localhost:10087/e/sandhk8/](http://localhost:10087/e/sandhk8/)
## Working 
### Objective 01
**login_view**

**Discription**:


>- This feature performs actions in **login.djhtml** which is rendered by **login:login_view**(login.views)
>- This feature enables user to login into their account which is powered by login form 
>- **login:login_view** takes a post request from the post form in **login.djhtml** and authenticates the user if username and password is correct.If user is authenticated it logs in the user.

**Exceptions** :
>- if `request.method`is not `"POST"`
 it redirects back to the login.djhtml
>- If the "username" or "password" is not correct it redirects back to the login.djhtml. 
***
**signup_view & user_create_view**

**Discription**:
>- This feature perform actions in **signup.djhtml** rendered by **login:signup.view**(login.views) which enables us to create a new account(user)
>- it is powered by signup forms in the **signup.djhtml** via `UserCreationForm()` which sends a post request to **login:user_create_view**
>- the **login:user_create_view** takes post request and makes a new user with the given "username" and "password"

**Exceptions** :
> - if the new password or username is not relevant according to the reqs. it reloads the **signup_djhtml** page with an error message.
>- if `request.method`is not `"POST"` or `UserCreationForm()` is not valid , it redirects to `signup.djhtml` 
 

***

### Objective 02
**Discription**:
>- This feature performs actions in **social_base.djhtml** which is rendered by **social:messages_view**
>- current user's name , employment, location , birthday and interests are shown by this page
>- the **social:messages_view** renders the logged in `UserInfo` object that is viewed in **social_base.djhtml** using class attributes

**Exceptions** :
>- if user is not authenticated , it redirects back to **login.djhtml**
***
### Objective 03
**Discription**:

**NOTE- for adding interests "updateInt_view" was created which links  a new path `path('updateinterests/', views.updateInt_view,name='updateInt_view'),`**
>- This feature performs action in **account.djhtml** which is rendered by **social:account_view** 
>- This feature enables the user to change password and update other peronal information (employment,birthday,location and interests) via `PasswordChangeForm` and html- forms respectively .
>- These forms are independent. `PasswordChangeForm` sends post request to **account.djhtml** and updates the password whereas html-forms have been created  for updating (employment,birthday,location) and send a post request to **socail:messages_view** for updating userinfo.
>- For adding interests an html form is created which adds one interest at a post and serves the post request to **updateInt_view** which adds the input into interests.

**Exceptions** :
>- If `request.method` is not "POST" it redirects the user to **account.djhtml**
>- if user is not authenticated , it redirects back to **login.djhtml**
>- **WARNING - ALWAYS ENTER BIRTHDAY ONLY IN FORM (YYYY-MM-DD) OTHERWISE IT WILL THROW UP AN ERROR**
***
### Objective04

**Discription**:
>- this feature performs action in **people.djhml** which is rendered by **social:people_view** and **people.js**
>- this page reflects all UserInfo objects (users)(initially only 1) that are not friend of the logged in user which are rendered by the queryset defined in **social:people_view**
>-  the "More" button in **people.djhtml** is linked to **people.js** that makes request to **social:more_ppl_view** which updates the session variable and limits the no. of users displayed.

**Exceptions** :
>- if user is not authenticated , it redirects back to **login.djhtml**
***
### Objective05
**Description**:

>- this feature performs action in **people.djhtml** which rendered by **social:friend_request_view** and **people.js**
>- It enables user to send friend request to the users(not friends) in **people.djhtml** by clicking on the button "Friend Request" which triggers `function friendRequest(event)` that makes post request to **social:friend_request_view** which retrieves the id of user whom  the request. was sent to .
>- **social:friend_request_view**  makes a new `FriendRequest` object .
>- **social:people_view** provides a querryset of all friendrequests to the logged in user and is rendered in **people.djhtml**.
>- Once the friend request is sent , the respective button is disabled unless the request gets declined .

**Exceptions** :
 >- if user is not authenticated , it redirects back to **login.djhtml**
***
### Objective06
**Description**:
>- This feature performs for part in **people.djhtml** where user accepts or declines the friend requests rendered by **social:accept_decline_view** and **people.js**.
>- The accept-decline button have specific ids which is posted to **social:accept_decline_view** via `acceptDeclineRequest(request)` in **people.js**
>- if the id is corresponds to accept , the user who sent the friend request is added to the querryset of logged in user and vice versa .
After the id is read , the corresponding `FriendRequest` object is deleted.

**Exceptions** :
>- If json data rendered by **people.js** is  None it returns HttpResponseNotFound()
>- if user is not authenticated , it redirects back to **login.djhtml**
***
### Objective07
**Description**:
>- This features is used to render all the UserInfo objects (users) that are friends of the logged in user. 
>- `for` loop is used to iterate over `user_info.friends.all()` to display all the friends.

**Exceptions** :
>- Initially it will show no users as no friends have been added.
***
### Objective08
**Description**: 

>- This feature enables the user to add a new post in **messages.djhtml** when the  "POST" button is pressed which triggers `function submitPost(event)` in **messages.js** to make a POST Request to **social:post_submit_view**.
>- **social:post_submit_view** creates a new POST object with content and owner.

**Exceptions** :
>-  If json data rendered by **messages.js** is  None it returns HttpResponseNotFound()
>- if user is not authenticated , it redirects back to **login.djhtml**
***
### Objective09
**Description**:
>- this feature displays all posts from all users in **messages.djhtml**
>- All posts are displayed in order(latest-oldest) using `models.Post.objects.all().order_by('-pk')`
>- Initially only the latest post will displayed and more post will be rendered on clicking "More" button.
>- "More" button increments the sessions variable in **more_post_view** and limits the number of posts displayed. (it resets when user logs out)

**Exceptions** :
>- if user is not authenticated , it redirects back to **login.djhtml**
***
### Objective10
**Description**:

>- This feature brings the advantage of liking the post and displaying the number of likes a post has . 
>- The "Like" button triggers the `function submitLike(event)` in **messages.js** that makes post request to **social:like_view** .
>- **socail:like_view** gets the `user_id` of the user that liked the post and add the UserInfo object to `user_info.likes.all` querryset .
>- the number of likes on a post are rendered by `.count` in **messages.djhtml**
>- Once the user has liked the post , the like button is disabled .

**Exceptions** :
>- if user is not authenticated , it redirects back to **login.djhtml**
***
### Objective11

**Test Database**
The following 7 test users have been created along with a variety of posts, likes , friends , friend request , user-information.

Username | password
------------ | ------------- 
**user1**| **killmonger1**
**user2**| **killmonger2**
**user3**| **killmonger3**
**user4**| **killmonger4**
**user5**| **killmonger5**
**user6**| **killmonger6**
**user7**| **killmonger7**
