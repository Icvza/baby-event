Event Logger app for New Parents to log milestones/eventful moments with thier newborn 


The app will have:

Main attributes:
    -Users: have many events, have many babies
    -event : Belongs to Users:
    -Babies: belongs to Users  has many events through users 

UX-flow:
    -Homescreen will have the ablilty to allow a user to sighn up to become a member of the app
        -Try to make the homescreen look nice with some CSS the home screen can not show any information about post - This is a user only app so only the user it self can see the content create
        -Learn more about Layout to see what kind of code I can save from writing 
    
    - Sign up page: 
        - Will show a form
            --Form : Will allow the user to create a profile with User name email and Baby name and age 
                
    - post/form: Will direct the user to a page where they will be able to create a new event 

    - Client will able to edit new event 

    - Right after post/form All pages should have a logout feature

DB's-structure:

    Users Table:
        - Name 
        - Age 
 
    Babies Table:
        - Name
        - Age
        - Foreign_id key for users
    
    Events Table:
        - Date time
        - Content 
        - Foreign_id key for users
        - Foreign_id key for babies


        Things that need to be done:


        - Edits Useres can edit the events 
        - Useres can edit their babies see
        - Delete useres can delete thier events 
        - Delete users can delete baby 
    
Will not be using "event" view page because post will be only be shown to users therefore the /events route should only be accesseable when logged in so the page shoyuld so 
1- if logged in show all events belonging to a user 
2- if not logged in reditect to login sigh up




    HTML/CSS: style and page all pages. 


    


    

    