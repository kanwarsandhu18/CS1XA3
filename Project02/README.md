# CS-1XA3 | PROJECT-02 | < sandhk8 >




## OVERVIEW
This **webpage** is the custom **CV** of **"Kanwar Shehraz Singh Sandhu"** that is built according to the **McMaster University's** engineering resume guidelines.
The inspiration of the webpage is taken from the template below but alot of changes have been made using `html` , `CSS`, `javascript` and little **`jquery`**.

>>Initial raw Template => [click](https://codepen.io/mariosmaselli/pen/CDcmb)
 
>**NOTE - SOME CODE OF CSS AND HTML IS TAKEN FROM TEMPLATE , NO JAVASCRIPT HAS BEEN TAKEN FROM THIS PARTICULAR TEMPLATE**


## Customizations using (<>html) and (#CSS)
* Edited **innerhtml** content according to my own resume and requirements.
- linked **images** according to the resume needs using `<img src="#"></img>`
* **About** dropdown that contains list of feature that describes the resume holder . 
  - made using `<button>` tag
  - added hover function on the button that makes it change colour.
  - the list in the dropdown box also glows on hover 
- A **card-container** is added to enclose the " name text and profile picture"
- Contact details become opaque while **hovering**.
- The social media icons are imported from [font awesome](https://fontawesome.com/). and have links that are linked using `<a href ="#"></a>` tag for instance-

```<a href="https://www.instagram.com/kanwar_18/" ><i class="fab fa-instagram fa-2x maroon"></i></a>```

- The **Education** header contains a box (that defines the program and institution) pops on hover.
- There is a dropdown box "Education History" that list names of recent institutions 
  - names of institutions and employers  glow on hover
- A doc **link** is added to the code for a side project.
- The "**skills**" sections has bars that define the level of specializations.
  - The length of bars have been modified according to the profile.
  - **Skill names** glow and blow up in size on hovering.
  - the background of particular **skill** becomes purple while hovering.
- The toggle button is added to change the theme of the webpage.

- Under hobbies , there are buttons that show more information while hovering.
- added cursor pointer on hover.
***
>>References -
>>  1. The idea of dropdown was inspired from [w3schools](https://www.w3schools.com/howto/howto_css_dropdown.asp)
>> 2. The idea of button was taken from [w3schools](https://www.w3schools.com/tags/tag_button.asp)
>> 3. The design for toggle button was taken from [w3schools](https://www.w3schools.com/howto/howto_css_switch.asp)

## Custom Javascript Code
>**NOTE- To use jquery , link =>`src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"` was added in script**
### Feature1 - Slideshow Function
* This js feature is implemented using lib-**jquery**.
* It changes the pictures in the `html` code automatically , every 3 seconds.
* It runs loop on the image set and the dots that signify the moving pictures.
>>References => some help for this code was taken from [w3schools](https://www.w3schools.com/howto/howto_js_slideshow.asp)
### Feature2 - Show box on toggle
* This features shows the description of personal projects on clicking on the button.
* Using the function `onclick` , when the button is clicked a box shows up that contains the text.
* Clicking on the box again , it minimizes the box
>>References => [w3schools](https://www.w3schools.com/howto/howto_js_toggle_hide_show.asp)
### Feature3 - Change theme on toggle 
* This feature changes the colour theme of the webpage on clicking the toggle button.
* This feature provides the user to choose between 2 colours and it changes the colour of background and the "**about**" button according to that.
* The `toggle` function allows to change between the 2 classes.

